import subprocess
import os
import time
import matplotlib.pyplot as plt
from typing import List, Tuple
import argparse
import numpy as np
import tempfile

def plot_times(file_paths: List[str], compiler_names: List[str], compilation_times: List[List[float]], execution_times: List[List[float]], num_reps: int) -> None:
    num_compilers = len(compiler_names)
    x = np.arange(len(file_paths))

    # Updated color palette for better aesthetics
    colors = ['#4c72b0', '#55a868', '#c44e52']
    hatch_patterns = ['//', '\\', '||']

    fig, ax = plt.subplots(figsize=(14, 10)) 
    bar_width = 0.15  
    for i in range(num_compilers):
        ax.bar(x + bar_width * i, [ct[i] for ct in compilation_times], bar_width, label=compiler_names[i], color=colors[i % len(colors)], hatch=hatch_patterns[i % len(hatch_patterns)])

    ax.set_xlabel("Problem", fontsize=16)  
    ax.set_ylabel("Time (seconds)", fontsize=16)  
    ax.set_title(f"Compilation Time (Average over {num_reps} repetitions)", fontsize=20) 
    ax.set_xticks(x + bar_width * (num_compilers - 1) / 2)
    ax.set_xticklabels(file_paths, fontsize=14) 
    ax.legend(fontsize=14)  # Increased legend font size
    ax.grid(True)
    plt.xticks(rotation=45)
    plt.tight_layout()
    plt.show()

    # Plotting Execution Times
    fig, ax = plt.subplots(figsize=(14, 10))  
    for i in range(num_compilers):
        ax.bar(x + bar_width * i, [et[i] for et in execution_times], bar_width, label=compiler_names[i], color=colors[i % len(colors)], hatch=hatch_patterns[i % len(hatch_patterns)])

    ax.set_xlabel("Problem", fontsize=16) 
    ax.set_ylabel("Time (seconds)", fontsize=16) 
    ax.set_title(f"Execution Time (Average over {num_reps} repetitions)", fontsize=20)
    ax.set_xticks(x + bar_width * (num_compilers - 1) / 2)
    ax.set_xticklabels(file_paths, fontsize=14) 
    ax.legend(fontsize=14)  # Increased legend font size
    ax.grid(True)
    plt.xticks(rotation=45)
    plt.tight_layout()
    plt.show()

class Compilation:
    def __init__(self, compiler_path: str, file_path: str, flags: List[str], preprocess: bool = False) -> None:
        self.compiler = os.path.expandvars(compiler_path)
        self.file_path = file_path
        self.flags = flags
        self.preprocess = preprocess

def preprocess_file(original_file_path: str) -> str:
    preprocessed_file_fd, preprocessed_file_path = tempfile.mkstemp(suffix=".c")
    with open(original_file_path, 'r') as original_file:
        lines = original_file.readlines()[1:]  # Skip the first line
    with os.fdopen(preprocessed_file_fd, 'w') as preprocessed_file:
        preprocessed_file.writelines(lines)
    return preprocessed_file_path

def measure_time(func) -> Tuple[any, float]:
    def wrapper(*args, **kwargs):
        start_time = time.time()
        result = func(*args, **kwargs)
        end_time = time.time()
        return result, end_time - start_time
    return wrapper

# Returns both compilation and execution times
def compute_times(compilation: Compilation, num_reps: int) -> Tuple[float, float]:
    if compilation.preprocess:
        file_path_to_compile = preprocess_file(compilation.file_path)
    else:
        file_path_to_compile = compilation.file_path

    compile_cmd = [compilation.compiler] + compilation.flags + [file_path_to_compile, "-o", os.path.splitext(compilation.file_path)[0]]
    execution_cmd = [os.path.splitext(compilation.file_path)[0]]

    compile_times = []
    execution_times = []

    for i in range(num_reps):
        start_cmp = time.time()
        subprocess.run(compile_cmd)
        end_cmp = time.time()
        compile_times.append(end_cmp - start_cmp)

        start_exec = time.time()
        subprocess.run(execution_cmd)
        end_exec = time.time()
        execution_times.append(end_exec - start_exec)

    if compilation.preprocess:
        os.remove(file_path_to_compile)

    avg_compile_time = sum(compile_times) / float(num_reps)
    avg_exec_time = sum(execution_times) / float(num_reps)
    return avg_compile_time, avg_exec_time

def main() -> None:
    parser = argparse.ArgumentParser("Compile and run source files for multiple compilers")
    parser.add_argument("--src", help="Paths to the source files", nargs='+', required=True)
    parser.add_argument("--n", help="Number of repetitions of the experiment (the resulting plot is an average)", required=False, default=10)
    args = parser.parse_args()
    file_paths = args.src
    num_reps = int(args.n)

    compilations = []
    for file_path in file_paths:
        compilations.append([
            Compilation("$CLANGIR_INSTALLDIR/bin/clang-19", file_path=file_path, flags=["-fopenmp", "-O2"]),
            Compilation("gcc", file_path=file_path, flags=["-fopenmp", "-O2"]),
            Compilation("$CLANGIR_INSTALLDIR/bin/clang-19", file_path=file_path, flags=["-fclangir", "-fopenmp-enable-irbuilder", "-fopenmp", "-O2"], preprocess=True)
        ])

    compiler_names = ["clang", "gcc", "clang-CIR"]
    all_compilation_times = []
    all_execution_times = []

    for file_compilations in compilations:
        file_compilation_times = []
        file_execution_times = []
        for compilation in file_compilations:
            avg_compile_time, avg_exec_time = compute_times(compilation, num_reps)
            file_compilation_times.append(avg_compile_time)
            file_execution_times.append(avg_exec_time)
        all_compilation_times.append(file_compilation_times)
        all_execution_times.append(file_execution_times)

    plot_times(file_paths, compiler_names, all_compilation_times, all_execution_times, num_reps)

if __name__ == "__main__":
    main()

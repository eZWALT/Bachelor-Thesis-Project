# CIR Bachelor Thesis Project (TFG) 🖥️🛠️

## Description

This repository contains auxiliary files and materials for my Bachelor Thesis project, completed during the final semester of my Computer Engineering & Science degree at the Universitat Politècnica de Catalunya (UPC), in collaboration with the Barcelona Supercomputing Center (BSC). This thesis serves as both a resource for the general tech public with basic compiler knowledge interested in modern compiler engineering techniques and frameworks (such as LLVM and MLIR), and as an open-source contribution to the novel ClangIR project. My contribution focuses on implementing OpenMP within this new Clang compiler compilation flow using MLIR.

## Contents

- **CIR/**: This directory contains an exact copy of the local version of ClangIR ([a subset of the official LLVM repository](https://github.com/llvm/clangir/tree/main/clang/lib/CIR)) that was modified during the thesis.
- **tests/**: Contains various tests used during the thesis to validate the lowerings and code generations.
- **presentation/**: This directory contains the presentation slides and the final PDF document.
- **compile-clangir.sh**: A sample script for compiling ClangIR and OpenMP from the original LLVM Project using CMake and the Ninja build system.

## Usage 

This repository is not intended for direct compilation, but if you wish to explore it:

1. Clone the LLVM project repository:
   ```sh
   git clone https://github.com/llvm/llvm-project.git
   ```
2. Replace the CIR/ folder in the cloned repository with the one from this repository.

3. Compile the project using the compile-clangir.sh script.
   
## Acknowledgements

This work would not have been possible without the guidance of my mentor from BSC, Roger Ferrer (@rofirrim).

## Work To-Do

Although the thesis is complete, some work remains to be submitted as pull requests or integrated upstream. The following tasks are still pending:

- [x] Upstream `taskwait`, `taskyield`, and `barrier` directives
- [ ] Upstream `Critical` (PR)
- [ ] Upstream `Master` (PR)
- [ ] Create `task` PR
- [ ] Create `single` PR
- [ ] Create `taskgroup` PR

## License

This project is licensed under the Apache 2.0 License. See the [LICENSE](./LICENSE) file for details.

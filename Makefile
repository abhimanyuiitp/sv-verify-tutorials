# Makefile for sv-verify-tutorials

# Variables
VERIBLE = verible-verilog-lint
SIM = iverilog
SIM_FLAGS = -g2012

# Directories
RTL_DIR = code/fifo/design
TB_DIR = tb

# Files
RTL_FILES = $(wildcard $(RTL_DIR)/*.sv)
TB_FILES = $(wildcard $(TB_DIR)/*.sv)

# Default target
.PHONY: all
all: lint sim

# Lint target
.PHONY: lint
lint:
	@echo "Running Verible linter..."
	$(VERIBLE) $(RTL_FILES)
	@echo "Lint complete!"

# Simulation target
.PHONY: sim
sim:
	@echo "Running simulation..."
	$(SIM) $(SIM_FLAGS) $(RTL_FILES) $(TB_FILES) -o sim.out
	./sim.out
	@echo "Simulation complete!"

# Clean target
.PHONY: clean
clean:
	@echo "Cleaning up..."
	rm -f sim.out *.vcd
	@echo "Clean complete!"

# Help target
.PHONY: help
help:
	@echo "Available targets:"
	@echo "  all   - Run lint and sim (default)"
	@echo "  lint  - Run Verible linter on RTL files"
	@echo "  sim   - Run simulation"
	@echo "  clean - Remove generated files"
	@echo "  help  - Show this help message"

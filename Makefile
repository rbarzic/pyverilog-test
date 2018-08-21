TOP:=$(shell pwd)

PYVERILOG?=../Pyverilog
NANORV32_TOP?=$(TOP)/testsuite/imported/nanorv32

PYVERILOG_PARSER?=$(PYVERILOG)/examples/example_parser.py


NANORV32_CMD?=python $(PYVERILOG_PARSER) \
-I$(NANORV32_TOP)/rtl/cores/ \
-I$(NANORV32_TOP)/rtl/chips/ \
-I$(NANORV32_TOP)/sim/verilog \
-I$(NANORV32_TOP)/rtl/ips/nanorv32_vic/verilog/include \
-I$(NANORV32_TOP)/common/generators

nanorv32:
	find $(NANORV32_TOP) -name "*.v" | \
	grep -v generated | \
	grep -v ctest     | \
	grep -v imported_from  | \
	grep -v uart_params.v  | \
	xargs -n 1 $(NANORV32_CMD)

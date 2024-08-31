# Default target architecture
TARGET ?= arm64

GO_RUN = go run github.com/cilium/ebpf/cmd/bpf2go 
GO_MOD_TIDY = go mod tidy
GO_BUILD = GOARCH=$(TARGET) GOOS=linux go build
PACKAGE = main
TYPE1 = trace_event
TYPE2 = trace_config
BPF_FILE = binder_transaction.byte.c
HEADERS = ./headers
BPF_OUTPUT = bpf
BINARY_NAME = btrace

all: tidy bpf build info 

tidy:
	$(GO_MOD_TIDY)

bpf: tidy
	$(GO_RUN) -go-package $(PACKAGE) --target=$(TARGET) -type $(TYPE1) -type $(TYPE2) $(BPF_OUTPUT) $(BPF_FILE) -- -I$(HEADERS)

build: tidy
	mkdir -p out
	$(GO_BUILD) -o out/$(BINARY_NAME)_$(TARGET)

clean:
	rm -f $(BPF_OUTPUT)_$(TARGET)_bpfel.go $(BPF_OUTPUT)_$(TARGET)_bpfel.o $(BINARY_NAME)_$(TARGET)

info:
	file $(BINARY_NAME)_$(TARGET)

.PHONY: all bpf tidy build clean
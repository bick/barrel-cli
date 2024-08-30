# Output directory
OUTPUT_DIR := ./build
TAR_DIR := ./build

# Application name
APP_NAME := noble

# Targets for different architectures
build: build-amd64 build-arm64

build-amd64:
	@echo "Building for x86_64 (amd64)..."
	GOARCH=amd64 GOOS=linux go build -o $(OUTPUT_DIR)/$(APP_NAME)-x86_64
	@echo "x86_64 build completed: $(OUTPUT_DIR)/$(APP_NAME)-x86_64"
	@echo "Creating tar.gz archive for x86_64..."
	mkdir -p $(TAR_DIR)
	tar -czf $(TAR_DIR)/$(APP_NAME)-x86_64.tar.gz -C $(OUTPUT_DIR) $(APP_NAME)-x86_64
	@echo "x86_64 tar.gz archive created: $(TAR_DIR)/$(APP_NAME)-x86_64.tar.gz"

build-arm64:
	@echo "Building for ARM (arm64)..."
	GOARCH=arm64 GOOS=linux go build -o $(OUTPUT_DIR)/$(APP_NAME)-arm64
	@echo "ARM build completed: $(OUTPUT_DIR)/$(APP_NAME)-arm64"
	@echo "Creating tar.gz archive for ARM..."
	mkdir -p $(TAR_DIR)
	tar -czf $(TAR_DIR)/$(APP_NAME)-arm64.tar.gz -C $(OUTPUT_DIR) $(APP_NAME)-arm64
	@echo "ARM tar.gz archive created: $(TAR_DIR)/$(APP_NAME)-arm64.tar.gz"

clean:
	@echo "Cleaning up build directory..."
	rm -rf $(OUTPUT_DIR)
	rm -rf $(TAR_DIR)
	@echo "Cleaned."

verify:
	@echo "Verifying builds..."
	file $(OUTPUT_DIR)/$(APP_NAME)-x86_64
	file $(OUTPUT_DIR)/$(APP_NAME)-arm64

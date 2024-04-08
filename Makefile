STRIPE_SECRET=sk_test_51P2w91SINnhHz2R6p9EXIYTKQNYmNUBYupr2UBJiWs8n2GdvgqFpyYU6z5yU03qujpV9iLdRg4yYV7TbqHS4WgtT00KXFnGK5I
STRIPE_KEY=pk_test_51P2w91SINnhHz2R6b2pbZsbqledSJyZPqS8TOKuw5ikq9bMTMaUJyvFPSR4dSWYdOB6bzFpt77ErH6a7HCOMoUB900WVRvYiLq
PORT=4000

## clean: cleans all binaries and runs go clean
clean:
	@echo "Cleaning..."
	@- rm -f dist/*
	@go clean
	@echo "Cleaned!"

## build: builds
build:
	@echo "Building..."
	@go build -o dist/gostripe ./cmd/web
	@echo "built!"
	
## start: starts
start: build
	@echo "Starting..."
	@env STRIPE_KEY=${STRIPE_KEY} STRIPE_SECRET=${STRIPE_SECRET} ./dist/gostripe -port=${PORT} &
	@echo "running!"

## stop: stops
stop:
	@echo "Stopping..."
	@-pkill -SIGTERM -f "gostripe -port=${PORT}"
	@echo "Stopped"

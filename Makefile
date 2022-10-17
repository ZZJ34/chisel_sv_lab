TEST_PACKAGE := design
TEST_NAME    := DataPath_8to3Tester2

# Generate Verilog code
gen:
	sbt run

# Run the all test
test_all:
	sbt test

# Run the designative test
test_one:
	sbt "testOnly ${TEST_PACKAGE}.${TEST_NAME}"

# clean
clean:
	rm -rf ./test_run_dir



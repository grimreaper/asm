#!/usr/bin/env bats

@test "hello_world produces hello world" {
  run $BATS_TEST_DIRNAME/hello_world
  [ $status = 0 ]
  [ "${lines[0]}" = "Hello, World!" ]
  [ ${#lines[@]} = 1 ]
}

@test "hello_world2 produces hello world" {
  run $BATS_TEST_DIRNAME/hello_world2
  [ $status = 0 ]
  #[ "${lines[0]}" = "Hello, World!" ]
  #[ ${#lines[@]} = 1 ]
}

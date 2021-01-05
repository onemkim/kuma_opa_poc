package test
import data.testData

default allow = false

get_input[input_msg]{
  input_msg := sprintf("Input v1 is by [%v]", [input])
}

get_data[data_msg]{
  data_msg := sprintf("Data v1 is [%v]", [data.global.data.TOPIC])
}

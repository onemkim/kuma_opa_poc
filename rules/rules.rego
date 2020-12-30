package rules
import data.dataset

default allow = false

allow{
  dataset.TOPIC[input.TOPIC].producers[_] == input.producer
}

allow{
  dataset.TOPIC[input.TOPIC].consumers[_] == input.consumer
}

get_input[input_msg]{
  input_msg := sprintf("Input v1 is by GIT [%v]", [input])
}

get_data[data_msg]{
  data_msg := sprintf("Data v1 is [%v]", [dataset])
}

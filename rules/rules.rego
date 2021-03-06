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
  input_msg := sprintf("Input v2 is by [%v]", [input])
}

get_data[data_msg]{
  data_msg := sprintf("Data v2 is by [%v]", [dataset])
}

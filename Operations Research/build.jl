using Weave;

list_out_formats()

weave("01_Introduciton.jmd", doctype=:"github", out_path=:pwd)
weave("02_SimpleLinearOptimization.jmd", doctype=:"github", out_path=:pwd)
weave("03_Julia-Basics.jmd", doctype=:"github", out_path=:pwd)
weave("03_Gadfly.jmd", doctype=:"github", out_path=:pwd)

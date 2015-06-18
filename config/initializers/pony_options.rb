Pony.options = {
  from: "quizapp@quizapp.com",
  via: :smtp,
  via_options: {
    address:              "172.16.100.83",
    port:                 "25",
    authentication:       "none",
  },
}
# Create datadog monitor 

resource "datadog_monitor" "cpumonitor" {
  name               = "cpu monitor"
  type               = "metric alert"
  message            = <<EOT
CPU usage alert. Notify: jeraldinnemg@gmail.com
EOT
  escalation_message = <<EOT
CPU usage alert: The threshold of 90% has been exceeded. 
Check the CPU usage on: {{#is_alert}}{{host.name}}{{/is_alert}}.
Notify: jeraldinnemg@gmail.com
EOT

  query = "avg(last_1m):avg:system.cpu.system{*} by {host} > 90"

  monitor_thresholds {
    ok       = 59
    warning  = 60
    critical = 90
  }

  notify_no_data = true

  tags = ["app:test", "env:stg"]
}


resource "datadog_dashboard" "demo_dashboard" {
  title        = "Demo Datadog Dashboard"
  description  = "Created using the Datadog provider in Terraform"
  layout_type  = "ordered"
  is_read_only = true

  widget {
    alert_value_definition {
      alert_id   = "1174904"
      precision  = 3
      unit       = "b"
      text_align = "center"
      title      = "Host CPU Usage"
    }
  }

  widget {
    check_status_definition {
      check     = "datadog.agent.up"
      grouping  = "check"
      group     = "host:Jeraldinnes-MacBook-Air.local"
      title     = "Host Availability"
      live_span = "1h"
    }
  }

  widget {
    timeseries_definition {
      request {
        q            = "avg:system.disk.in_use{*}"
        display_type = "area"
        style {
          palette = "orange"
        }
      }
      title       = "Disk Space Usage (%)"
      show_legend = true
    }
  }
  widget {
    timeseries_definition {
      request {
        q            = "avg:system.load.1{*}"
        display_type = "line"
        style {
          palette = "green"
        }
      }
      title       = "CPU Load (1-minute Average)"
      show_legend = true
    }
  }
}



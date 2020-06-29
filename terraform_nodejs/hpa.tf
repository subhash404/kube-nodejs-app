resource "kubernetes_horizontal_pod_autoscaler" "nodejs" {
  metadata {
    name      = "nodejs"
    namespace = "default"
  }
  spec {
    min_replicas = 8
    max_replicas = 10
    scale_target_ref {
      api_version = "apps/v1"
      kind        = "Deployment"
      name        = "nodejs"
    }
    metric {
      type = "Resource"
      resource {
        name = "memory"
        target {
          type                = "Utilization"
          average_utilization = "60"
        }
      }
    }
    metric {
      type = "Resource"
      resource {
        name = "cpu"
        target {
          type                = "Utilization"
          average_utilization = "50"
        }
      }
    }
  }
}


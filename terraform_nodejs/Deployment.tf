resource "kubernetes_deployment" "nodejs" {
  metadata {
    name      = "nodejs"
    namespace = "default"
  }

  spec {
    replicas = 10

    selector {
      match_labels = {
        service = "nodejs"
      }
    }

    template {
      metadata {
        labels = {
          service = "nodejs"
        }
      }

      spec {
        container {
          name  = "nodejs"
          image = "subhash403/nodejs"

          port {
            container_port = 3000
          }

          resources {
            limits {
              memory = "128Mi"
              cpu    = "50m"
            }

            requests {
              memory = "64Mi"
              cpu    = "50m"
            }
          }

          image_pull_policy = "IfNotPresent"
        }

        image_pull_secrets {
          name = "aws-ecr"
        }

        priority_class_name = "high-priority"
      }
    }

    strategy {
      type = "RollingUpdate"

      rolling_update {
        max_unavailable = "1"
        max_surge       = "1"
      }
    }

    min_ready_seconds = 5
  }
}


resource "kubernetes_service" "nodejs" {
  metadata {
    name      = "nodejs"
    namespace = "default"

    labels = {
      app = "nodejs"
    }
  }

  spec {
    port {
      name     = "http"
      protocol = "TCP"
      port     = 3000
    }

    selector = {
      service = "nodejs"
    }

    type = "LoadBalancer"
  }
}


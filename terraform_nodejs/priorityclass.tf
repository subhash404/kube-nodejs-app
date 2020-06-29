resource "kubernetes_priority_class" "high_priority" {
  metadata {
    name = "high-priority"
  }

  value       = 1000000000
  description = "high priority"
}


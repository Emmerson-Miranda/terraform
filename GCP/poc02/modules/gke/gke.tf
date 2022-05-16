#https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/container_cluster#example-usage---with-a-separately-managed-node-pool-recommended
resource "google_container_cluster" "spinnaker-tutorial" {
  name               = "spinnaker-tutorial"
  location           = var.zone
  initial_node_count = 3
  

  node_config {
    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    #service_account = var.sa.email
    machine_type = "n1-standard-2"
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
}

/*

$ k get clusterrolebinding user-admin-binding -o yaml
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRoleBinding
metadata:
  creationTimestamp: "2021-04-19T23:00:46Z"
  managedFields:
  - apiVersion: rbac.authorization.k8s.io/v1
    fieldsType: FieldsV1
    fieldsV1:
      f:roleRef:
        f:apiGroup: {}
        f:kind: {}
        f:name: {}
      f:subjects: {}
    manager: kubectl-create
    operation: Update
    time: "2021-04-19T23:00:46Z"
  name: user-admin-binding
  resourceVersion: "3179"
  selfLink: /apis/rbac.authorization.k8s.io/v1/clusterrolebindings/user-admin-binding
  uid: c4db34e0-475b-4ea8-835b-15733528632a
roleRef:
  apiGroup: rbac.authorization.k8s.io
  kind: ClusterRole
  name: cluster-admin
subjects:
- apiGroup: rbac.authorization.k8s.io
  kind: User
  name: student-01-fb0e0e9e84c7@qwiklabs.net
*/


/*
$ k get clusterrolebinding spinnaker-admin -o yaml
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRoleBinding
metadata:
  creationTimestamp: "2021-04-19T23:01:26Z"
  managedFields:
  - apiVersion: rbac.authorization.k8s.io/v1
    fieldsType: FieldsV1
    fieldsV1:
      f:roleRef:
        f:apiGroup: {}
        f:kind: {}
        f:name: {}
      f:subjects: {}
    manager: kubectl-create
    operation: Update
    time: "2021-04-19T23:01:26Z"
  name: spinnaker-admin
  resourceVersion: "3416"
  selfLink: /apis/rbac.authorization.k8s.io/v1/clusterrolebindings/spinnaker-admin
  uid: bf2ef414-840f-4a6d-89ee-587a0ac21bef
roleRef:
  apiGroup: rbac.authorization.k8s.io
  kind: ClusterRole
  name: cluster-admin
subjects:
- kind: ServiceAccount
  name: default
  namespace: default
*/

# create a folder for AMER region
resource "google_folder" "amer" {
  display_name = "AMER"
  parent       = module.top_level_org.edge_workloads_folder_name
}

# Create sub folder for USA
resource "google_folder" "usa" {
  display_name = "USA"
  parent       = google_folder.amer.name
}
resource "aci_application_profile" "terraform_app" {
  tenant_dn = "${aci_tenant.myTenant.id}"
  name       = "demo_app_profile"
}


resource "aci_application_epg" "my_web_epg" {
    application_profile_dn  = "${aci_application_profile.terraform_app.id}"
    name                            = "db_epg"
    description                   = "%s"
    annotation                    = "tag_epg"
    exception_tag               = "0"
    flood_on_encap            = "disabled"
    fwd_ctrl                    = "none"
    has_mcast_source            = "no"
    is_attr_based_e_pg      = "no"
    match_t                         = "AtleastOne"
    name_alias                  = "alias_epg"
    pc_enf_pref                 = "unenforced"
    pref_gr_memb                = "exclude"
    prio                            = "unspecified"
    shutdown                    = "no"
  }

resource "aci_application_epg" "application_epg2" {
    application_profile_dn  = "${aci_application_profile.terraform_app.id}"
    name                            = "web_epg"
    description                   = "%s"
    annotation                    = "tag_epg"
    exception_tag               = "0"
    flood_on_encap            = "disabled"
    fwd_ctrl                    = "none"
    has_mcast_source            = "no"
    is_attr_based_e_pg      = "no"
    match_t                         = "AtleastOne"
    name_alias                  = "alias_epg"
    pc_enf_pref                 = "unenforced"
    pref_gr_memb                = "exclude"
    prio                            = "unspecified"
    shutdown                    = "no"
  }


resource "aci_application_epg" "application_epg3" {
    application_profile_dn  = "${aci_application_profile.terraform_app.id}"
    name                            = "backend_epg"
    description                   = "%s"
    annotation                    = "tag_epg"
    exception_tag               = "0"
    flood_on_encap            = "disabled"
    fwd_ctrl                    = "none"
    has_mcast_source            = "no"
    is_attr_based_e_pg      = "no"
    match_t                         = "AtleastOne"
    name_alias                  = "alias_epg"
    pc_enf_pref                 = "unenforced"
    pref_gr_memb                = "exclude"
    prio                            = "unspecified"
    shutdown                    = "no"
  }

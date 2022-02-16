connection: "tpchlooker"

# include all the views
include: "/views/**/*.view"
include: "/business_summary_analysis.dashboard.lookml"

datagroup: looker_intensive7_khrystyna_vatsyk_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: looker_intensive7_khrystyna_vatsyk_default_datagroup

# explore: d_customer {}

# explore: d_dates {}

# explore: d_part {}

# explore: d_supplier {}

explore: f_lineitems {
  view_label : "Line Items"
  label: "Line Items"
  join: d_customer{
    view_label: "Customers"
    type: left_outer
    sql_on: ${f_lineitems.l_custkey} = ${d_customer.c_custkey} ;;
    relationship: many_to_one
  }
  join: d_dates {
    view_label: "Dates"
    type: left_outer
    sql_on: ${f_lineitems.l_orderdatekey} = ${d_dates.datekey} ;;
    relationship: many_to_one
  }
  join: d_part {
    view_label: "Parts"
    type: left_outer
    sql_on: ${f_lineitems.l_partkey} = ${d_part.p_partkey} ;;
    relationship: many_to_one
  }
  join: d_supplier {
    view_label: "Suppliers"
    type: left_outer
    sql_on: ${f_lineitems.l_suppkey} = ${d_supplier.s_suppkey} ;;
    relationship: many_to_one
  }
  join: derived_suppliers {
    view_label: "Derived Suppliers"
    type: left_outer
    sql_on: ${f_lineitems.l_suppkey} = ${derived_suppliers.s_suppkey} ;;
    relationship: many_to_one
  }

}

view: d_customer {
  sql_table_name: "DATA_MART"."D_CUSTOMER"
    ;;

  dimension: c_address {
    label: "Address"
    type: string
    sql: ${TABLE}."C_ADDRESS" ;;
  }

  dimension: c_custkey {
    label: "Customer Key"
    primary_key: yes
    type: number
    sql: ${TABLE}."C_CUSTKEY" ;;
    hidden: yes
  }

  dimension: c_mktsegment {
    label: "Market Segment"
    type: number
    sql: ${TABLE}."C_MKTSEGMENT" ;;
  }

  dimension: c_name {
    label: "Customer Name"
    type: string
    sql: ${TABLE}."C_NAME" ;;
  }

  dimension: c_nation {
    label: "Nation"
    type: string
    sql: ${TABLE}."C_NATION" ;;
  }

  dimension: c_phone {
    label: "Phone"
    type: string
    sql: ${TABLE}."C_PHONE" ;;
  }

  dimension: c_region {
    label: "Phone Number"
    type: string
    sql: ${TABLE}."C_REGION" ;;
  }

  measure: count {
    label: "Number of Customers"
    type: count
    drill_fields: [c_name]
  }
}

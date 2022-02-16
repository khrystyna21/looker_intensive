view: d_supplier {
  sql_table_name: "DATA_MART"."D_SUPPLIER"
    ;;

  dimension: s_acctbal {
    label: "Account Balance"
    type: number
    sql: ${TABLE}."S_ACCTBAL" ;;
  }

  dimension: s_address {
    label: "Address"
    type: string
    sql: ${TABLE}."S_ADDRESS" ;;
  }

  dimension: s_name {
    label: "Supplier Name"
    type: string
    sql: ${TABLE}."S_NAME" ;;
    link: {
      label: "Supplier's Website"
      url: "http://www.google.com/search?q={{ value | url_encode}}"
      icon_url : "http://google.com/favicon.ico"
    }
  }

  dimension: s_nation {
    label: "Nation"
    type: string
    sql: ${TABLE}."S_NATION" ;;
  }

  dimension: s_phone {
    label: "Phone Number"
    type: string
    sql: ${TABLE}."S_PHONE" ;;
  }

  dimension: s_region {
    label: "Region"
    type: string
    sql: ${TABLE}."S_REGION" ;;
  }

  dimension: s_suppkey {
    label: "Supplier Key"
    primary_key: yes
    type: number
    sql: ${TABLE}."S_SUPPKEY" ;;
    hidden: yes
  }

  dimension: balance_tier {
    description: "Cohort of suppliers according to Account Balance"
    type: tier
    tiers: [1, 3001, 5001, 7001]
    style: integer
    sql: ${s_acctbal} ;;
  }

  measure: count {
    label: "Number of Suppliers"
    type: count
    drill_fields: [s_name]
  }
}

view: derived_suppliers {
  derived_table: {
    sql: SELECT s_suppkey, s_name, sum(l_extendedprice) / (select sum(l_extendedprice) from f_lineitems where l_orderstatus = 'F') * 100 as percent_revenue
    FROM f_lineitems
    JOIN d_supplier on s_suppkey = l_suppkey
    WHERE l_orderstatus  = 'F'
    GROUP BY s_suppkey, s_name
    ORDER BY s_name ;;
  }

  dimension: s_suppkey {
    label: "Supplier Key"
    primary_key: yes
    type: number
    sql: ${TABLE}.s_suppkey ;;
    hidden: yes
  }

  dimension: s_name {
    label: "Supplier Name"
    type: string
    sql: ${TABLE}.s_name ;;
    hidden: yes
  }

  dimension: percent_revenue {
    label: "Percent of Total Revenue"
    type: number
    sql: ${TABLE}.percent_revenue ;;
    value_format: "0.0000\%"
  }
}

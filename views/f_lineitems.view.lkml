view: f_lineitems {
  sql_table_name: "DATA_MART"."F_LINEITEMS"
    ;;

  dimension: l_availqty {
    label: "Available Quantity"
    type: number
    sql: ${TABLE}."L_AVAILQTY" ;;
  }

  dimension: l_clerk {
    label: "Clerk"
    type: string
    sql: ${TABLE}."L_CLERK" ;;
  }

  dimension: l_commitdatekey {
    label: "Commit Date Key"
    type: number
    sql: ${TABLE}."L_COMMITDATEKEY" ;;
    hidden: yes
  }

  dimension: l_custkey {
    label: "Customer Key"
    type: number
    sql: ${TABLE}."L_CUSTKEY" ;;
    hidden: yes
  }

  dimension: l_discount {
    label: "Discount"
    type: number
    sql: ${TABLE}."L_DISCOUNT" ;;
  }

  dimension: l_extendedprice {
    label: "Extended Price"
    type: number
    sql: ${TABLE}."L_EXTENDEDPRICE" ;;
  }

  dimension: l_linenumber {
    label: "Line Number"
    type: number
    sql: ${TABLE}."L_LINENUMBER" ;;
  }

  dimension: l_orderdatekey {
    label: "Order Date Key"
    type: number
    sql: ${TABLE}."L_ORDERDATEKEY" ;;
    hidden: yes
  }

  dimension: l_orderkey {
    label: "Order Key"
    type: number
    sql: ${TABLE}."L_ORDERKEY" ;;
    hidden: yes
  }

  dimension: l_orderpriority {
    label: "Order Priority"
    type: string
    sql: ${TABLE}."L_ORDERPRIORITY" ;;
  }

  dimension: l_orderstatus {
    label: "Order Status"
    type: string
    sql: ${TABLE}."L_ORDERSTATUS" ;;
  }

  dimension: l_partkey {
    label: "Part Key"
    type: number
    sql: ${TABLE}."L_PARTKEY" ;;
    hidden: yes
  }

  dimension: l_quantity {
    label: "Quantity"
    type: number
    sql: ${TABLE}."L_QUANTITY" ;;
  }

  dimension: l_receiptdatekey {
    label: "Receipt Date Key"
    type: number
    sql: ${TABLE}."L_RECEIPTDATEKEY" ;;
    hidden: yes
  }

  dimension: l_returnflag {
    label: "Return Flag"
    type: string
    sql: ${TABLE}."L_RETURNFLAG" ;;
  }

  dimension: l_shipdatekey {
    label: "Shipping Date Key"
    type: number
    sql: ${TABLE}."L_SHIPDATEKEY" ;;
    hidden: yes
  }

  dimension: l_shipinstruct {
    label: "Shipping Instructions"
    type: string
    sql: ${TABLE}."L_SHIPINSTRUCT" ;;
  }

  dimension: l_shipmode {
    label: "Shipping Mode"
    type: string
    sql: ${TABLE}."L_SHIPMODE" ;;
  }

  dimension: l_shippriority {
    label: "Shipping Priority"
    type: number
    sql: ${TABLE}."L_SHIPPRIORITY" ;;
  }

  dimension: l_suppkey {
    label: "Supplier Key"
    type: number
    sql: ${TABLE}."L_SUPPKEY" ;;
    hidden: yes
  }

  dimension: l_supplycost {
    label: "Supplier Cost"
    type: number
    sql: ${TABLE}."L_SUPPLYCOST" ;;
  }

  dimension: l_tax {
    label: "Tax"
    type: number
    sql: ${TABLE}."L_TAX" ;;
  }

  dimension: l_totalprice {
    label: "Total Price"
    type: number
    sql: ${TABLE}."L_TOTALPRICE" ;;
  }

  dimension: primary_key {
    label: "Primary Key"
    primary_key: yes
    sql: CONCAT(${TABLE}."L_ORDERKEY", ${TABLE}."L_LINENUMBER") ;;
    hidden: yes
  }

  measure: total_sales_price {
    description: "Total sales from items sold"
    type: sum
    sql: ${l_extendedprice} * (1+${l_tax}) * (1-${l_discount});;
    value_format_name: usd
  }

  measure: average_sales_price {
    description: "Average sale price of items sold"
    type: average
    sql: ${l_extendedprice} * (1+${l_tax}) * (1-${l_discount});;
    value_format_name: usd
  }

  measure: cumulative_total_sales {
    description: "Cumulative total sales from items sold (also known as a running total)"
    type: running_total
    sql: ${total_sales_price} ;;
    value_format_name: usd
  }

  measure: total_sales_price_by_air {
    label: "Total Sales Price Shipped By Air"
    description: "Total sales of items shipped by air"
    type: sum
    filters: [l_shipmode: "AIR"]
    sql: ${l_extendedprice} * (1+${l_tax}) * (1-${l_discount}) ;;
    value_format_name: usd
  }

  measure: total_russia_sales {
    description: "Total sales by customers from Russia"
    type: sum
    filters: [d_customer.c_nation: "RUSSIA"]
    sql: ${l_extendedprice} * (1+${l_tax}) * (1-${l_discount}) ;;
    value_format_name: usd
    }
}

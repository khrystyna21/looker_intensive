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

  dimension: order_date {
    type: date
    sql: ${d_dates.date_val_date} ;;
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

  dimension: sales_price {
    description: "Price for items after taxes and discounts"
    type: number
    sql: ${TABLE}."L_EXTENDEDPRICE" * (1 - ${TABLE}."L_DISCOUNT") * (1 +  ${TABLE}."L_TAX") ;;
  }

  dimension: primary_key {
    label: "Primary Key"
    primary_key: yes
    sql: CONCAT(${TABLE}."L_ORDERKEY", ${TABLE}."L_LINENUMBER") ;;
    hidden: yes
  }

  dimension: customer_country {
    type: string
    hidden: yes
    sql:  ${d_customer.c_nation} ;;
  }

  dimension: is_russia {
    type: yesno
    hidden: yes
    sql: ${customer_country} = 'RUSSIA' ;;
  }

  dimension: is_returned {
    type: yesno
    hidden: yes
    sql: ${l_returnflag} = 'R' ;;
  }

  dimension: is_completed {
    type: yesno
    hidden: yes
    sql: ${l_orderstatus} = 'F' ;;
  }

  dimension: is_shipped_by_air {
    type: yesno
    hidden: yes
    sql: ${l_shipmode} in ('AIR', 'REG AIR') ;;
  }

  measure: count_customers {
    type: count_distinct
    hidden: yes
    sql: ${l_custkey} ;;
  }

  measure: count_orders {
    label: "Number of Orders"
    type: count_distinct
    sql: ${l_orderkey} ;;
  }

  measure: total_sales_price {
    description: "Total sales from items sold"
    type: sum
    sql: ${sales_price};;
    # value_format_name: usd
    value_format: "$0.00,,\" M\""
    drill_fields: [details*]
  }

  measure: average_sales_price {
    description: "Average sale price of items sold"
    type: average
    sql: ${sales_price};;
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
    filters: [is_shipped_by_air: "yes"]
    sql: ${sales_price} ;;
    # value_format_name: usd
    value_format: "$0.00,,\" M\""
    drill_fields: [details*]
  }

  measure: total_russia_sales {
    description: "Total sales by customers from Russia"
    type: sum
    filters: [is_russia: "yes"]
    sql: ${sales_price} ;;
    # value_format_name: usd
    value_format: "$0.00,,\" M\""
    drill_fields: [details*]
  }

  measure: total_gross_revenue {
    description: "Total price of completed sales"
    type: sum
    filters: [is_completed: "yes"]
    sql: ${l_extendedprice} ;;
    # value_format_name: usd
    value_format: "$0.00,,\" M\""
    drill_fields: [part_details*]
  }

  measure: total_cost {
    description: "Cost of Goods Sold"
    type: sum
    sql: ${l_supplycost} ;;
    # value_format_name: usd
    value_format: "$0.00,,\" M\""
    drill_fields: [details*]
  }

  measure: total_gross_margin_amount  {
    description: "Total Gross Revenue - Total Cost"
    type: number
    sql: ${total_gross_revenue} - ${total_cost} ;;
    # value_format_name: usd
    value_format: "$0.00,,\" M\""
    drill_fields: [supp_details*]
  }

  measure: gross_margin_percentage {
    description: "Total Gross Margin Amount / Total Gross Revenue"
    type: number
    sql: ${total_gross_margin_amount} / NULLIF(${total_gross_revenue}, 0) ;;
    value_format_name: percent_2
  }

  measure: number_returned{
    label: "Number of Items Returned"
    description: "Number of items that were returned by dissatisfied customers"
    type: sum
    filters: [is_returned: "yes"]
    sql: ${l_quantity} ;;
    drill_fields: [details*]
  }

  measure: number_sold {
    label: "Total Number of Items Sold"
    description: "Number of items that were sold"
    type: sum
    sql: ${l_quantity} ;;
  }

  measure: item_returned_rate {
    description: "Number of Items Returned / Total Number of Items Sold"
    sql: ${number_returned} / nullif(${number_sold}, 0) ;;
    type: number
    value_format_name: decimal_2
  }

  measure: avg_cust_spend {
    label: "Average Spend per Customer"
    description: "Total Sales Price / Total Number of Customers"
    type: number
    sql: ${total_sales_price} / NULLIF(${count_customers}, 0) ;;
    value_format_name: usd
  }

  set: details {
    fields: [d_customer.c_name, d_supplier.s_name, d_part.p_brand, d_part.p_mfgr, order_date]
  }

  set: supp_details {
    fields: [d_supplier.s_name, d_supplier.s_nation, d_supplier.s_region, d_supplier.s_acctbal, d_supplier.balance_tier]
  }

  set: part_details {
    fields: [d_part.p_name, d_part.p_brand, d_part.p_mfgr]
  }
}

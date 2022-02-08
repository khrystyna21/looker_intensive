view: d_dates {
  sql_table_name: "DATA_MART"."D_DATES"
    ;;

  dimension_group: date_val {
    label: "Value"
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."DATE_VAL" ;;
  }

  dimension: datekey {
    label: "Date Key"
    primary_key: yes
    type: number
    sql: ${TABLE}."DATEKEY" ;;
    hidden: yes
  }

  dimension: day_number {
    label: "Day"
    type: number
    sql: day(${date_val_raw}) ;;
  }

  dimension: day_of_week {
    label: "Day of the Week"
    type: number
    sql: ${TABLE}."DAY_OF_WEEK" ;;
  }

  dimension: dayname_of_week {
    label: "Name of the Day"
    type: string
    sql: ${TABLE}."DAYNAME_OF_WEEK" ;;
  }

  dimension: month_name {
    label: "Month"
    type: string
    sql: ${TABLE}."MONTH_NAME" ;;
  }

  dimension: month_num {
    label: "Month Number"
    type: number
    sql: ${TABLE}."MONTH_NUM" ;;
  }

  dimension: quarter {
    label: "Quarter"
    type: number
    sql: ${TABLE}."QUARTER" ;;
  }

  dimension: year {
    label: "Year"
    type: number
    sql: ${TABLE}."YEAR" ;;
  }
}

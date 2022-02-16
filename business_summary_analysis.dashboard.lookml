- dashboard: business_summary_analysis
  title: Business Summary Analysis
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  elements:
  - title: Year over Year Gross Margin Trend
    name: Year over Year Gross Margin Trend
    model: looker_intensive7_khrystyna_vatsyk
    explore: f_lineitems
    type: looker_column
    fields: [d_dates.year, f_lineitems.total_gross_margin_amount]
    sorts: [d_dates.year]
    limit: 500
    dynamic_fields: [{category: table_calculation, expression: "(${f_lineitems.total_gross_margin_amount}\
          \ - offset(${f_lineitems.total_gross_margin_amount}, -1))/abs(offset(${f_lineitems.total_gross_margin_amount},\
          \ -1))", label: Year over Year Gross Margin Trend, value_format: !!null '',
        value_format_name: percent_2, _kind_hint: measure, table_calculation: year_over_year_gross_margin_trend,
        _type_hint: number}]
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: circle_outline
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
      palette_id: fb7bb53e-b77b-4ab6-8274-9d420d3d73f3
      options:
        steps: 5
    y_axes: [{label: '', orientation: left, series: [{axisId: f_lineitems.total_gross_margin_amount,
            id: f_lineitems.total_gross_margin_amount, name: Total Gross Margin Amount}],
        showLabels: true, showValues: true, maxValue: !!null '', minValue: !!null '',
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: 0
    hide_legend: true
    series_types: {}
    series_colors: {}
    trend_lines: []
    swap_axes: false
    show_null_points: true
    interpolation: linear
    show_dropoff: true
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    hidden_fields: [year_over_year_gross_margin_trend]
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    row: 6
    col: 0
    width: 12
    height: 7
  - title: Revenue and Margin Trend Comparison - 1995
    name: Revenue and Margin Trend Comparison - 1995
    model: looker_intensive7_khrystyna_vatsyk
    explore: f_lineitems
    type: looker_column
    fields: [f_lineitems.total_gross_revenue, f_lineitems.total_gross_margin_amount,
      d_dates.date_val_month, d_dates.month_name]
    filters:
      d_dates.year: '1995'
    sorts: [d_dates.date_val_month]
    limit: 500
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: circle
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    show_null_points: true
    interpolation: linear
    y_axes: [{label: '', orientation: left, series: [{axisId: f_lineitems.total_gross_revenue,
            id: f_lineitems.total_gross_revenue, name: Total Gross Revenue}, {axisId: f_lineitems.total_gross_margin_amount,
            id: f_lineitems.total_gross_margin_amount, name: Total Gross Margin Amount}],
        showLabels: true, showValues: true, minValue: !!null '', unpinAxis: false,
        tickDensity: custom, tickDensityCustom: 31, type: linear}]
    hide_legend: false
    series_types: {}
    show_dropoff: false
    defaults_version: 1
    hidden_fields: [d_dates.date_val_month]
    value_labels: legend
    label_type: labPer
    map_plot_mode: points
    heatmap_gridlines: false
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: light
    map_position: fit_data
    map_scale_indicator: 'off'
    map_pannable: true
    map_zoomable: true
    map_marker_type: circle
    map_marker_icon_name: default
    map_marker_radius_mode: proportional_value
    map_marker_units: meters
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: fixed
    show_legend: true
    quantize_map_value_colors: false
    reverse_map_value_colors: false
    row: 6
    col: 12
    width: 12
    height: 7
  - title: Revenue per Account Balance Group of Suppliers
    name: Revenue per Account Balance Group of Suppliers
    model: looker_intensive7_khrystyna_vatsyk
    explore: f_lineitems
    type: looker_bar
    fields: [d_supplier.balance_tier, f_lineitems.total_gross_revenue]
    fill_fields: [d_supplier.balance_tier]
    sorts: [d_supplier.balance_tier]
    limit: 500
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    font_size: '12'
    series_types: {}
    value_labels: legend
    label_type: labPer
    defaults_version: 1
    show_null_points: true
    interpolation: linear
    listen: {}
    row: 13
    col: 12
    width: 12
    height: 7
  - title: Gross Margin Comparison by Shipping Method - 1995
    name: Gross Margin Comparison by Shipping Method - 1995
    model: looker_intensive7_khrystyna_vatsyk
    explore: f_lineitems
    type: looker_pie
    fields: [f_lineitems.total_gross_margin_amount, f_lineitems.l_shipmode]
    filters:
      d_dates.year: '1995'
    sorts: [f_lineitems.total_gross_margin_amount desc]
    limit: 500
    value_labels: legend
    label_type: labPer
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    font_size: 12
    show_null_points: true
    interpolation: linear
    row: 13
    col: 0
    width: 12
    height: 7
  - title: Number of Completed Sales per Region - 1995
    name: Number of Completed Sales per Region - 1995
    model: looker_intensive7_khrystyna_vatsyk
    explore: f_lineitems
    type: looker_pie
    fields: [f_lineitems.total_sales_price, d_supplier.s_region]
    filters:
      d_supplier.s_region: "-NULL"
      d_dates.year: '1995'
      f_lineitems.l_orderstatus: F
    sorts: [f_lineitems.total_sales_price desc]
    limit: 500
    value_labels: legend
    label_type: labPer
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: pivot
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    defaults_version: 1
    show_null_points: true
    interpolation: linear
    listen: {}
    row: 20
    col: 0
    width: 12
    height: 7
  - title: Total Revenue - 1 Jan 1995
    name: Total Revenue - 1 Jan 1995
    model: looker_intensive7_khrystyna_vatsyk
    explore: f_lineitems
    type: single_value
    fields: [f_lineitems.total_gross_revenue]
    filters:
      d_dates.date_val_date: 1995/01/01
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    series_types: {}
    row: 0
    col: 0
    width: 6
    height: 6
  - title: Total Number of Orders - 1 Jan 1995
    name: Total Number of Orders - 1 Jan 1995
    model: looker_intensive7_khrystyna_vatsyk
    explore: f_lineitems
    type: single_value
    fields: [f_lineitems.count_orders]
    filters:
      d_dates.date_val_date: 1995/01/01
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    row: 0
    col: 6
    width: 6
    height: 6
  - title: Gross Margin % -  Jan 1995
    name: Gross Margin % -  Jan 1995
    model: looker_intensive7_khrystyna_vatsyk
    explore: f_lineitems
    type: single_value
    fields: [f_lineitems.gross_margin_percentage]
    filters:
      d_dates.date_val_date: 1995/01
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    series_types: {}
    hidden_fields: []
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    row: 0
    col: 12
    width: 6
    height: 6
  - title: Total Number of Returns - Jan 1995
    name: Total Number of Returns - Jan 1995
    model: looker_intensive7_khrystyna_vatsyk
    explore: f_lineitems
    type: single_value
    fields: [f_lineitems.number_returned]
    filters:
      d_dates.date_val_date: 1995/01
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    series_types: {}
    hidden_fields: []
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    row: 0
    col: 18
    width: 6
    height: 6
  - title: Top 10 Suppliers
    name: Top 10 Suppliers
    model: looker_intensive7_khrystyna_vatsyk
    explore: f_lineitems
    type: looker_grid
    fields: [d_supplier.s_name, derived_suppliers.percent_revenue, f_lineitems.gross_margin_percentage,
      f_lineitems.total_gross_revenue]
    sorts: [f_lineitems.gross_margin_percentage desc, derived_suppliers.percent_revenue
        desc]
    limit: 500
    dynamic_fields: [{category: table_calculation, label: Percent of Total Revenue
          Calc, value_format: !!null '', value_format_name: percent_4, calculation_type: percent_of_column_sum,
        table_calculation: percent_of_total_revenue_calc, args: [f_lineitems.total_gross_revenue],
        _kind_hint: measure, _type_hint: number}]
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: editable
    limit_displayed_rows: true
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_cell_visualizations:
      f_lineitems.gross_margin_percentage:
        is_active: false
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '10'
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    hidden_fields: [percent_of_total_revenue_calc]
    row: 20
    col: 12
    width: 12
    height: 7
  - title: Month over Month Daily Sales Trend  - Jan 1995
    name: Month over Month Daily Sales Trend  - Jan 1995
    model: looker_intensive7_khrystyna_vatsyk
    explore: f_lineitems
    type: looker_line
    fields: [f_lineitems.total_sales_price, d_dates.day_number, d_dates.date_val_month]
    pivots: [d_dates.date_val_month]
    fill_fields: [d_dates.date_val_month]
    filters:
      d_dates.date_val_month: 1995/01, 1994/12
    sorts: [d_dates.date_val_month, d_dates.day_number]
    limit: 500
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: circle_outline
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    series_types: {}
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    listen: {}
    row: 27
    col: 0
    width: 24
    height: 7

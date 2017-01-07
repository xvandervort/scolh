var payment<%= @counters[classname] %> = {
  payer: '<%= obj.payer %>',
  payee: '<%= obj.payee %>',
  amount: '<%= obj.amount %>',
  trigger_type: 'Date',
  trigger_detail: '<%= obj.date %>'
}
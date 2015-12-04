@Records = React.createClass
  getInitialState: ->
    records: @props.data

  getDefaultProps: ->
    records: []

  credits: ->
    credits = @state.records.filter (val) -> val.amount >= 0
    credits.reduce ((prev, curr) ->
      prev + parseFloat(curr.amount)
    ), 0

  debits: ->
    debits = @state.records.filter (val) -> val.amount < 0
    debits.reduce ((prev, curr) ->
      prev + parseFloat(curr.amount)
    ), 0

  balance: ->
    @debits() + @credits()

  addRecord: (record) ->
    records = React.addons.update(@state.records, { $push: [record] })
    @setState records: records

  deleteRecord: (record) ->
    index = @state.records.indexOf record
    records = React.addons.update(@state.records, { $splice: [[index, 1]] })
    @replaceState records: records

  updateRecord: (record, data) ->
    index = @state.records.indexOf record
    records = React.addons.update(@state.records, { $splice: [[index, 1, data]] })
    @replaceState records: records

  render: ->
    React.DOM.div
      className: 'records'
      React.DOM.div
        className: 'panel panel-default'
        React.DOM.div
          className: 'panel-heading collapsed'
          'data-target': '#stats'
          'data-toggle': 'collapse'
          'Account Overview'
          React.DOM.button
            type: 'button'
            className: 'btn panal-close-icon'
            React.DOM.span
              className: 'glyphicon glyphicon-chevron-down'
        React.DOM.div
          className: 'collapse panel-collapse'
          id: 'stats'
          React.DOM.div
            className: 'panel-body'
            React.DOM.p
              className: 'lead'
              'Generic description'
          React.DOM.ul
            className: 'list-group'
            React.createElement AmountBox, type: 'success', amount: @credits(), text: 'Credit'
            React.createElement AmountBox, type: 'danger', amount: @debits(), text: 'Debit'
            React.createElement AmountBox, type: 'info', amount: @balance(), text: 'Balance'
      React.DOM.div
        className: 'panel panel-form'
        React.DOM.div
          className: 'panel-heading collapsed'
          'data-target': '#addRecord'
          'data-toggle': 'collapse'
          'Add New Data'
          React.DOM.button
            type: 'button'
            className: 'btn panal-close-icon'
            React.DOM.span
              className: 'glyphicon glyphicon-chevron-down'
        React.DOM.div
          className: 'collapse panel-collapse'
          id: 'addRecord'
          React.DOM.div
            className: 'panel-body'
            React.createElement RecordForm, handleNewRecord: @addRecord
      React.DOM.div
        className: 'panel panel-default'
        React.DOM.div
          className: 'panel-heading collapsed'
          'data-target': '#allData'
          'data-toggle': 'collapse'
          'The Data'
          React.DOM.button
            type: 'button'
            className: 'btn panal-close-icon'
            React.DOM.span
              className: 'glyphicon glyphicon-chevron-down'
        React.DOM.div
          className: 'collapse panel-collapse'
          id: 'allData'
          React.DOM.div
            className: 'panel-body'
            React.DOM.p
              className: 'lead'
              'Generic description'
          React.DOM.table
            className: 'table table-condensed table-hover'
            React.DOM.thead null,
              React.DOM.tr null,
                React.DOM.th null, 'Date'
                React.DOM.th null, 'Title'
                React.DOM.th null, 'Amount'
                React.DOM.th null, 'Actions'
            React.DOM.tbody null,
              for record in @state.records
                React.createElement Record, key: record.id, record: record, handleDeleteRecord: @deleteRecord, handleEditRecord: @updateRecord

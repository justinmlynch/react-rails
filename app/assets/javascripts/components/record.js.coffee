@Record = React.createClass
  getInitialState: ->
    edit: false

  handleToggle: (e) ->
    e.preventDefault()
    @setState edit: !@state.edit

  handleDelete: (e) ->
    e.preventDefault()
    $.ajax
      method: 'DELETE'
      url: "/records/#{ @props.record.id }"
      dataType: 'JSON'
      success: () =>
        @props.handleDeleteRecord @props.record

  handleEdit: (e) ->
    e.preventDefault()
    data =
      title: React.findDOMNode(@refs.title).value
      date: React.findDOMNode(@refs.date).value
      amount: React.findDOMNode(@refs.amount).value
    $.ajax
      method: 'PUT'
      url: "/records/#{ @props.record.id }"
      dataType: 'JSON'
      data:
        record: data
      success: (data) =>
        @setState edit: false
        @props.handleEditRecord @props.record, data

  recordRow: ->
    React.DOM.tr null,
      React.DOM.td null, @props.record.date
      React.DOM.td null, @props.record.title
      React.DOM.td null, amountFormat(@props.record.amount)
      React.DOM.td null,
        React.DOM.div
          className: 'btn-group btn-group-xs'
          role: 'group'
          React.DOM.button
            className: 'btn btn-default'
            onClick: @handleToggle
            React.DOM.span
              className: 'glyphicon glyphicon-edit'
          React.DOM.button
            className: 'btn btn-default'
            onClick: @handleDelete
            React.DOM.span
              className: 'glyphicon glyphicon-remove'

  recordForm: ->
    React.DOM.tr null,
      React.DOM.td null,
        React.DOM.input
          className: 'form-control'
          type: 'text'
          defaultValue: @props.record.date
          ref: 'date'
      React.DOM.td null,
        React.DOM.input
          className: 'form-control'
          type: 'text'
          defaultValue: @props.record.title
          ref: 'title'
      React.DOM.td null,
        React.DOM.input
          className: 'form-control'
          type: 'number'
          defaultValue: @props.record.amount
          ref: 'amount'
      React.DOM.td null,
        React.DOM.div
          className: 'btn-group btn-group-xs'
          React.DOM.button
            className: 'btn btn-default'
            onClick: @handleEdit
            React.DOM.span
              className: 'glyphicon glyphicon-ok'
          React.DOM.button
            className: 'btn btn-danger'
            onClick: @handleToggle
            React.DOM.span
              className: 'glyphicon glyphicon-remove'

  render: ->
    if @state.edit
      @recordForm()
    else
      @recordRow()

@RecordForm = React.createClass
  getInitialState: ->
    title: ''
    date: dateFormat(new Date())
    amount: ''

  valid: ->
    @state.title && @state.date && @state.amount

  handleChange: (e) ->
    name = e.target.name
    @setState "#{ name }": e.target.value

  handleSubmit: (e) ->
    e.preventDefault()
    $.post '/records', { record: @state }, (data) =>
      @props.handleNewRecord data
      @setState @getInitialState()
    , 'JSON'

  render: ->
    React.DOM.form
      className: 'form-inline'
      onSubmit: @handleSubmit
      React.DOM.div
        className: 'formrow'
        React.DOM.div
          className: 'form-group'
          React.DOM.div
            className: 'input-group date'
            React.DOM.input
              className: 'form-control'
              'data-provide': 'datepicker'
              type: 'text'
              name: 'date'
              value: @state.date
              onChange: @handleChange
              React.DOM.span
                className: 'input-group-addon'
                React.DOM.i
                  className: 'glyphicon glyphicon-th'
        React.DOM.div
          className: 'form-group'
          React.DOM.input
            type: 'text'
            className: 'form-control'
            placeholder: 'Title'
            name: 'title'
            value: @state.title
            onChange: @handleChange
        React.DOM.div
          className: 'form-group'
          React.DOM.div
            className: 'input-group'
            React.DOM.div
              className: 'input-group-addon'
              '$'
            React.DOM.input
              type: 'number'
              className: 'form-control'
              placeholder: 'Amount'
              value: @state.amount
              name: 'amount'
              onChange: @handleChange
            React.DOM.div
              className: 'input-group-addon'
              '.00'
      React.DOM.button
        type: 'submit'
        className: 'btn btn-primary btn-lg btn-block'
        disabled: !@valid()
        'Add Item'

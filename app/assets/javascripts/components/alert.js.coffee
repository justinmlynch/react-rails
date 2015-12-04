@AlertDismissable = React.createClass
  getInitialState: ->
    alertVisible: true

  handleAlertDismiss: (e) ->
    e.preventDefault()
    @setState alertVisible: false

  handleAlertShow: (e) ->
    e.preventDefault()
    @setState alertVisible: true

  alertShown: ->
    React.DOM.div
      className: 'alert alert-danger alert-dismissable fade in'
      role: 'alert'
      React.DOM.button
        className: 'close'
        'data-dismiss': 'alert'
        type: 'button'
        React.DOM.span null,
        '×'
      React.DOM.h4 null,
      'Warning'
      React.DOM.p null,
      'Error Message Body'

  alertHidden: ->
    React.DOM.div null,
      React.DOM.button
        className: 'btn btn-default'
        onClick: @handleAlertShow
        type: 'button'
        'data-toggle': 'alert'
        React.DOM.span null,
        'Show Alert'

  render: ->
    if @state.alertVisible
      @alertShown()
    else
      @alertHidden()
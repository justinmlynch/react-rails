@AmountBox = React.createClass
  render: ->
    React.DOM.li
      className: 'list-group-item'
      @props.text + ': '
      React.DOM.span
        className: 'badge badge-' + @props.type 
        amountFormat(@props.amount)
      
          
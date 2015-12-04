@Timer = React.createClass
  getInitialState: -> 
    secondsElapsed: 0 

  tick: ->
    @setState secondsElapsed: @state.secondsElapsed + 1

  componentDidMount: ->
    @interval = setInterval(@tick, 1000)

  componentWillUnmount: ->
    clearInterval @interval

  render: ->
    React.createElement 'p', className: 'navbar-text', @state.secondsElapsed
    

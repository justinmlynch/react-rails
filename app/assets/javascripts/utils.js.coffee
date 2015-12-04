@amountFormat = (amount) ->
  '$ ' + Number(amount).toLocaleString()

@dateFormat = (date) ->
  dd = date.getDate()
  mm = date.getMonth() + 1
  yyyy = date.getFullYear()
  if dd < 10 
    dd = '0' + dd
  if mm < 10 
    mm = '0' + mm
  mm + '/' + dd + '/' + yyyy
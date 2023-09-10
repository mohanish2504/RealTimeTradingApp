package trades

type Ticker struct {
	Symbol string `json:"s"`
	Price string `json:"p"`
	Quantity string `json:"q"`
	Time int64 `json:"T"`
}


func (t Ticker) String() string {
	return t.Symbol + " 1s" // will try to make it dynamic ==> 1s, 1m
}
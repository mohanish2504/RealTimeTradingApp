package api

import (
	"github.com/gofiber/fiber/v2"
	"github.com/gofiber/contrib/websocket"
)

func AddRoutes(app *fiber.App) {
	app.Use("/ws", func(c *fiber.Ctx) error {
        if websocket.IsWebSocketUpgrade(c) {
            c.Locals("allowed", true)
            return c.Next()
        }
        return fiber.ErrUpgradeRequired
    })
	app.Get("ws/trades/:ticker",websocket.New(ListenTicker))
	
	app.Route("api/v1", func(router fiber.Router){
		router.Get("/tickers",GetAllTickers)

	})
	
	
}

func main() {}
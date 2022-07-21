import { RoutesInput } from "../types/types"
import UserController from "../controllers/user.controller"
export default ({ app }: RoutesInput) => {
  app.get("/api/users", async (req, res) => {
    const user = await UserController.GetUser()
    return res.send( user )
  })
}

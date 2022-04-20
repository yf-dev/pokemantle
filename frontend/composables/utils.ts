export const todayPuzzleNumber = () => {
  const origin = new Date("2022-04-20T00:00:00")
  const today = new Date()
  const days = Math.floor((today.getTime() - origin.getTime()) / 86400000)
  return days
}

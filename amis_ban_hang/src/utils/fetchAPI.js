/**
 * 1. Nạp dữ liệu từ 'url' với phương thức là 'method'
 * Author: Hainh (02/08/2022)
 *
 */
async function fetchAPI(url, method) {
  return (
    await fetch(url, {
      method,
    }).catch(error => console.log(error))
  ).json()
}

export default fetchAPI

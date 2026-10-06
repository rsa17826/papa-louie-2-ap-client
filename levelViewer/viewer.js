"use strict"
// ================= settings (persisted) =================
localStorage.lv_ts ??= "32"
localStorage.lv_cols ??= "62"
localStorage.lv_place ??=
  '{"0":{"tile_1583.png":{"col":0,"row":0,"padX":0,"padY":0},"tile_4235.png":{"col":0,"row":31,"padX":0,"padY":0},"tile_6259.png":{"col":0,"row":12,"padX":0,"padY":0},"tile_1827.png":{"col":0,"row":24,"padX":0,"padY":0},"tile_5871.png":{"col":0,"row":28,"padX":0,"padY":0},"tile_734.png":{"col":9,"row":15,"padX":0,"padY":0}},"1":{"tile_1583.png":{"col":0,"row":0,"padX":0,"padY":0},"tile_4235.png":{"col":0,"row":31,"padX":0,"padY":0},"tile_6259.png":{"col":0,"row":12,"padX":0,"padY":0},"tile_1827.png":{"col":0,"row":24,"padX":0,"padY":0},"tile_5871.png":{"col":0,"row":28,"padX":0,"padY":0},"tile_734.png":{"col":9,"row":15,"padX":0,"padY":0}},"2":{"tile_3682.png":{"col":0,"row":28,"padX":0,"padY":0},"tile_5783.png":{"col":0,"row":0,"padX":0,"padY":0},"tile_551.png":{"col":0,"row":31,"padX":0,"padY":0},"tile_3186.png":{"col":0,"row":12,"padX":0,"padY":0},"tile_1995.png":{"col":0,"row":24,"padX":0,"padY":0}},"3":{"tile_3682.png":{"col":0,"row":28,"padX":0,"padY":0},"tile_5783.png":{"col":0,"row":0,"padX":0,"padY":0},"tile_551.png":{"col":0,"row":31,"padX":0,"padY":0},"tile_3186.png":{"col":0,"row":12,"padX":0,"padY":0},"tile_1995.png":{"col":0,"row":24,"padX":0,"padY":0}},"4":{"tile_4141.png":{"col":0,"row":28,"padX":0,"padY":0},"tile_5314.png":{"col":0,"row":0,"padX":0,"padY":0},"tile_4681.png":{"col":0,"row":31,"padX":0,"padY":0},"tile_5741.png":{"col":0,"row":24,"padX":0,"padY":0}},"5":{"tile_5314.png":{"col":0,"row":0,"padX":0,"padY":0},"tile_4681.png":{"col":0,"row":31,"padX":0,"padY":0},"tile_5741.png":{"col":0,"row":24,"padX":0,"padY":0},"tile_3090.png":{"col":0,"row":12,"padX":0,"padY":0},"tile_4141.png":{"col":0,"row":28,"padX":0,"padY":0}},"9":{"tile_4862.png":{"col":0,"row":28,"padX":0,"padY":0},"tile_4064.png":{"col":0,"row":12,"padX":0,"padY":0},"tile_734.png":{"col":0,"row":31,"padX":0,"padY":0},"tile_4567.png":{"col":0,"row":0,"padX":0,"padY":0},"tile_1733.png":{"col":0,"row":24,"padX":0,"padY":0}},"tile_4862.png":{"col":0,"row":28,"padX":0,"padY":0},"tile_4064.png":{"col":0,"row":12,"padX":0,"padY":0},"tile_734.png":{"col":9,"row":15,"padX":0,"padY":0},"tile_4567.png":{"col":0,"row":0,"padX":0,"padY":0}}'
localStorage.lv_unit ??= "tiles"
localStorage.lv_colId ??= "0"
localStorage.lv_colX ??= "1"
localStorage.lv_colY ??= "2"
const place = JSON.parse(localStorage.lv_place)
const savePlace = () => {
  localStorage.lv_place = JSON.stringify(place)
}
const ts = () => Number(localStorage.lv_ts)
const mcols = () => Number(localStorage.lv_cols)

// Entity names + sprites, stored per tileset like the tile placements:
// ents[tileset][kind][id] = { name, src, sx, sy, sw, sh, ox, oy, scale }
localStorage.lv_ents ??=
  '{"0":{"item":{"1":{"name":"coin","src":"coin.png","sx":0,"sy":0,"sw":15,"sh":18,"ox":8.5,"oy":14,"scale":1},"2":{"name":"red coin","src":"redCoin.png","sx":0,"sy":0,"sw":23,"sh":20,"ox":4.5,"oy":12,"scale":1}},"enemy":{"34":{"src":"burger.png","sx":0,"sy":0,"sw":28,"sh":28,"ox":0,"oy":-50,"scale":3}}},"1":{"item":{"1":{"name":"coin","src":"coin.png","sx":0,"sy":0,"sw":15,"sh":18,"ox":8.5,"oy":14,"scale":1}},"enemy":{"34":{"src":"burger.png","sx":0,"sy":0,"sw":28,"sh":28,"ox":0,"oy":-50,"scale":3}}},"2":{"item":{"1":{"name":"coin","src":"coin.png","sx":0,"sy":0,"sw":15,"sh":18,"ox":8.5,"oy":14,"scale":1}},"enemy":{"34":{"src":"burger.png","sx":0,"sy":0,"sw":28,"sh":28,"ox":0,"oy":-50,"scale":3}}},"3":{"item":{"1":{"name":"coin","src":"coin.png","sx":0,"sy":0,"sw":15,"sh":18,"ox":8.5,"oy":14,"scale":1},"3":{"name":"purple coins","src":"purpleCoin.png","sx":0,"sy":0,"sw":23,"sh":20,"ox":4.5,"oy":12,"scale":2},"5":{"name":"heart","src":"heart.png","sx":0,"sy":0,"sw":22,"sh":20,"ox":5,"oy":12,"scale":1}},"enemy":{"34":{"src":"burger.png","sx":0,"sy":0,"sw":28,"sh":28,"ox":0,"oy":-50,"scale":3}}},"4":{"item":{"1":{"src":"coin.png","sx":0,"sy":0,"sw":15,"sh":18,"ox":8.5,"oy":14,"scale":1}},"enemy":{"34":{"src":"burger.png","sx":0,"sy":0,"sw":28,"sh":28,"ox":0,"oy":-50,"scale":3}}},"5":{"item":{"1":{"src":"coin.png","sx":0,"sy":0,"sw":15,"sh":18,"ox":8.5,"oy":14,"scale":1.5,"name":"coin"},"5":{"name":"heart","src":"heart.png","sx":0,"sy":0,"sw":22,"sh":20,"ox":5,"oy":12,"scale":1}},"enemy":{"34":{"src":"burger.png","sx":0,"sy":0,"sw":28,"sh":28,"ox":0,"oy":-50,"scale":3}}},"6":{"item":{"1":{"src":"coin.png","sx":0,"sy":0,"sw":15,"sh":18,"ox":8.5,"oy":14,"scale":1}},"enemy":{"34":{"src":"burger.png","sx":0,"sy":0,"sw":28,"sh":28,"ox":0,"oy":-50,"scale":3}}},"7":{"item":{"1":{"src":"coin.png","sx":0,"sy":0,"sw":15,"sh":18,"ox":8.5,"oy":14,"scale":1}},"enemy":{"34":{"src":"burger.png","sx":0,"sy":0,"sw":28,"sh":28,"ox":0,"oy":-50,"scale":3}}},"8":{"item":{"1":{"src":"coin.png","sx":0,"sy":0,"sw":15,"sh":18,"ox":8.5,"oy":14,"scale":1}},"enemy":{"34":{"src":"burger.png","sx":0,"sy":0,"sw":28,"sh":28,"ox":0,"oy":-50,"scale":3}}},"9":{"item":{"1":{"src":"coin.png","sx":0,"sy":0,"sw":15,"sh":18,"ox":8.5,"oy":14,"scale":1,"name":"coin"}},"enemy":{"34":{"src":"burger.png","sx":0,"sy":0,"sw":28,"sh":28,"ox":0,"oy":-50,"scale":3}}}}'
localStorage.lv_uploads ??= "{}" // key "upload:<filename>" -> data URL
const ents = JSON.parse(localStorage.lv_ents)
const uploads = JSON.parse(localStorage.lv_uploads)
const saveEnts = () => {
  localStorage.lv_ents = JSON.stringify(ents)
}
const KINDS = ["enemy", "item", "object"]
const curTset = () => (cur.world ? cur.world.tileset : "default")
const tilePlace = () => place[curTset()] || {}
let sheetsLoaded = false
const uploadImgs = {}
const $ = (id) => document.getElementById(id)

// Errors are not swallowed: anything thrown ends up in the red box.
function showError(msg) {
  $("err").textContent = msg
  $("err").hidden = false
}
window.addEventListener("error", (e) => showError(e.message))
window.addEventListener("unhandledrejection", (e) =>
  showError(
    String(
      e.reason && e.reason.message ? e.reason.message : e.reason,
    ),
  ),
)

// ================= tile id tables (from DataManager.as) =================
const range = (a, b) =>
  Array.from({ length: b - a + 1 }, (_, i) => a + i)
const SOLID = new Set([
  ...range(50, 53),
  ...range(112, 115),
  ...range(174, 177),
  ...range(236, 239),
  ...range(1736, 1748),
  ...range(1798, 1810),
  ...range(1860, 1870),
])
const THRU = new Set([
  ...range(1062, 1070),
  ...range(1558, 1566),
  ...range(1196, 1204),
  ...range(1692, 1700),
])
const FLOOR_SLOPE = new Set([
  62, 1054, 1550, 187, 1179, 1675, 195, 1187, 1683, 63, 1055, 1551,
  64, 1056, 1552, 65, 1057, 1553, 186, 1178, 1674, 194, 1186, 1682,
  66, 1058, 1554, 189, 1181, 1677, 686, 67, 1059, 1555, 188, 1180,
  1676, 687, 130, 1122, 1618, 68, 1060, 1556, 682, 684, 69, 1061,
  1557, 683, 685, 131, 1123, 1619,
])
const CEIL_SLOPE = new Set([
  606, 622, 620, 408, 623, 621, 409, 607, 479, 473, 350, 351, 352,
  478, 472, 353, 624, 475, 608, 625, 474, 349,
])
const SPECIAL = {
  99991: ["collision", "rgba(255,0,0,.45)"],
  99992: ["slope", "rgba(255,150,0,.45)"],
  99993: ["thru", "rgba(0,120,255,.45)"],
  99994: ["grab", "rgba(255,255,0,.45)"],
  99995: ["ladder", "rgba(0,255,0,.45)"],
}
const ENEMY_NAMES = new Map([
  [1, "Onion"],
  [2, "Brown Onion"],
  [3, "Army Onion"],
  [5, "Kaiser Onion"],
  [6, "Red Tomato"],
  [7, "Roma Tomato"],
  [8, "Runt Tomato"],
  [11, "Party Sub"],
  [12, "Burger Slider"],
  [13, "Brussel Lark"],
  [14, "Lettuce Lark"],
  [15, "Leafy Lark"],
  [16, "Dill Wheel"],
  [17, "Dill Worm"],
  [18, "Dill Weed"],
  [19, "Blue Shroom"],
  [20, "Thorn Shroom"],
  [21, "Bow Shroom"],
  [22, "Bacobar"],
  [23, "Bacoburn"],
  [24, "Bacobites"],
  [25, "Swiss Zack"],
  [26, "Cheddar Mack"],
  [27, "Pepper Jack"],
  [28, "Radish"],
  [29, "Laddish"],
  [30, "Pararadish"],
  [31, "Cheese Wheel"],
  [32, "Jellyback"],
  [33, "Awesome Saucer"],
  [34, "Burgerzilla"],
  [35, "Sarge"],
  [37, "Radley Madish"],
])

// ================= XML parsing (mirrors ScreenData / WorldData) =================
function field(el, tag) {
  const n = [...el.children].find((c) => c.tagName === tag)
  if (!n) throw new Error(`<${el.tagName}> is missing <${tag}>`)
  return n.textContent.trim()
}
function num(s, ctx) {
  const n = Number(s)
  if (Number.isNaN(n)) throw new Error(`non-numeric "${s}" in ${ctx}`)
  return n
}
const rows = (s, f) =>
  s === "" ? [] : s.split("|").map((r) => r.split(",").map(f))

function parseLevel(el) {
  const roomID = field(el, "roomID")
  const c = `room ${roomID}`
  const tiles = rows(field(el, "tileArray"), (v) =>
    v.split("#").map((t) => num(t, `${c} tileArray`)),
  )
  const typed = (name) =>
    rows(field(el, name), (v, i) =>
      i < 4 ? num(v, `${c} ${name}`) : v,
    )
  const L = {
    roomID,
    tiles,
    title: field(el, "roomTitle"),
    items: rows(field(el, "itemArray"), (v) =>
      num(v, `${c} itemArray`),
    ),
    enemies: typed("enemyArray"),
    objects: typed("objectArray"),
    events: field(el, "eventArray"),
    doors: rows(field(el, "doorArray"), (v) =>
      num(v, `${c} doorArray`),
    ),
    start: field(el, "startPoint")
      .split(",")
      .map((v) => num(v, `${c} startPoint`)),
  }
  L.layerCount = Math.max(...tiles.flat().map((cell) => cell.length))
  return L
}
function parseWorld(el) {
  const start = field(el, "startRoom")
  return {
    id: field(el, "worldID"),
    title: field(el, "worldTitle"),
    tileset: field(el, "tileset"),
    start: start === "" ? 0 : num(start, "startRoom") - 1,
    rooms: rows(field(el, "roomArray"), (v) =>
      num(v, "world roomArray"),
    ),
    doors: rows(field(el, "doorArray"), (v) =>
      num(v, "world doorArray"),
    ),
  }
}
function parseXML(text) {
  const doc = new DOMParser().parseFromString(text, "application/xml")
  const pe = doc.getElementsByTagName("parsererror")[0]
  if (pe)
    throw new Error(
      "XML parse error: " + pe.textContent.slice(0, 300),
    )
  const lv = [...doc.getElementsByTagName("level")]
  const wd = [...doc.getElementsByTagName("world")]
  if (!lv.length) throw new Error("no <level> elements found")
  if (!wd.length) throw new Error("no <world> elements found")
  const levels = new Map()
  for (const el of lv) {
    const L = parseLevel(el)
    levels.set(L.roomID, L)
  }
  return { levels, worlds: wd.map(parseWorld) }
}

// ================= tile sheets / atlas =================
const SHEETS = window.TILE_SHEETS
const images = {}
let atlas = new Map() // tile id -> {im, sx, sy}

function rebuildAtlas() {
  atlas = new Map()
  const T = ts(),
    C = mcols()
  const tset = cur.world ? cur.world.tileset : "default"
  const worldPlace = place[tset] || {}

  for (const f of SHEETS) {
    const p = worldPlace[f]
    if (!p || !images[f]) continue
    const im = images[f]
    const cw = Math.floor((im.width - p.padX) / T),
      ch = Math.floor((im.height - p.padY) / T)
    if (p.col < 0 || p.row < 0 || p.col + cw > C)
      throw new Error(
        `${f}: ${cw} tiles wide placed at col ${p.col} row ${p.row} does not fit in ${C} columns`,
      )
    for (let r = 0; r < ch; r++)
      for (let c = 0; c < cw; c++)
        atlas.set((p.row + r) * C + p.col + c, {
          im,
          sx: p.padX + c * T,
          sy: p.padY + r * T,
        })
  }
}
Promise.all(
  SHEETS.map(
    (f) =>
      new Promise((res) => {
        const im = new Image()
        im.onload = () => {
          images[f] = im
          res()
        }
        im.onerror = () => {
          showError("failed to load images/" + f)
          res()
        }
        im.src = "images/" + f
      }),
  ),
).then(() => {
  sheetsLoaded = true
  rebuildAtlas()
  buildSheetList()
  renderAll()
})

// ================= level state =================
let data = null
const cur = { world: null, roomIdx: 0, level: null, hiDoor: -1 }
const view = { x: 0, y: 0, z: 1 }
let needFit = false // fit() was requested while the Level tab was hidden
const vis = {}

function loadText(text) {
  $("err").hidden = true
  data = parseXML(text)
  const sel = $("world")
  sel.innerHTML = ""
  data.worlds.forEach((w, i) =>
    sel.add(new Option(`${w.title} (tileset ${w.tileset})`, i)),
  )
  selectWorld(0)
}
function selectWorld(i) {
  cur.world = data.worlds[i]
  $("world").value = i

  rebuildAtlas() // Rebuild atlas for this world's tileset
  buildSheetList() // Refresh sheet UI for this tileset

  const box = $("rooms")
  box.innerHTML = ""
  cur.world.rooms.forEach((row, ri) => {
    const b = document.createElement("button")
    const lvl = data.levels.get(String(row[6]))
    if (!lvl)
      throw new Error(
        `world "${cur.world.title}" room ${ri + 1} uses roomID ${row[6]} but no <level> has it`,
      )
    b.textContent = `${ri + 1}: ${lvl.title} (id ${row[6]})`
    b.onclick = () => selectRoom(ri)
    box.appendChild(b)
  })
  selectRoom(cur.world.start)
  if ($("tab-entities").classList.contains("active")) buildEntities()
}
function selectRoom(i, hiDoor = -1) {
  const w = cur.world,
    row = w.rooms[i]
  if (!row)
    throw new Error(
      `room index ${i} does not exist in world "${w.title}"`,
    )
  if (row.length < 7)
    throw new Error(
      `world "${w.title}" room ${i + 1} row has ${row.length} fields, need roomID at [6]`,
    )
  const lv = data.levels.get(String(row[6]))
  if (!lv)
    throw new Error(
      `world "${w.title}" room ${i + 1} uses roomID ${row[6]} but no <level> has it`,
    )
  cur.roomIdx = i
  cur.level = lv
  cur.hiDoor = hiDoor
  ;[...$("rooms").children].forEach((b, bi) =>
    b.classList.toggle("on", bi === i),
  )
  const lay = $("layers")
  lay.innerHTML = ""
  for (let l = 0; l < lv.layerCount; l++) {
    vis[l] ??= true
    const lab = document.createElement("label")
    const cb = document.createElement("input")
    cb.type = "checkbox"
    cb.checked = vis[l]
    cb.onchange = () => {
      vis[l] = cb.checked
      render()
    }
    lab.append(cb, ` layer ${l}`)
    lay.appendChild(lab)
  }
  $("info").textContent =
    `${lv.title}  roomID ${lv.roomID}\n${lv.tiles[0].length} x ${lv.tiles.length} tiles, ${lv.layerCount} layers\n` +
    `start ${lv.start.join(",")}  doors ${lv.doors.length}  enemies ${lv.enemies.length}\nitems ${lv.items.length}  objects ${lv.objects.length}`
  $("info").style.whiteSpace = "pre"
  fit()
  render()
}
function fit() {
  if (!$("cv").clientWidth) {
    needFit = true
    return
  }
  const cv = $("cv"),
    L = cur.level,
    T = ts()
  const W = L.tiles[0].length * T,
    H = L.tiles.length * T
  view.z = Math.min(cv.clientWidth / W, cv.clientHeight / H)
  view.x = (cv.clientWidth - W * view.z) / 2
  view.y = (cv.clientHeight - H * view.z) / 2
}
function doorLink(roomIdx, di) {
  for (const d of cur.world.doors) {
    if (d[0] === roomIdx + 1 && d[1] === di)
      return { room: d[2] - 1, door: d[3] }
    if (d[2] === roomIdx + 1 && d[3] === di)
      return { room: d[0] - 1, door: d[1] }
  }
  return null
}

// ================= level rendering =================
const unitPx = () => (localStorage.lv_unit === "tiles" ? ts() : 1)
const entPos = (row) => {
  const cx = Number(localStorage.lv_colX),
    cy = Number(localStorage.lv_colY),
    ci = Number(localStorage.lv_colId)
  if (row[cx] === undefined || row[cy] === undefined)
    throw new Error(`entity row [${row}] has no column ${cx}/${cy}`)
  return {
    x: Number(row[cx]) * unitPx(),
    y: Number(row[cy]) * unitPx(),
    id: row[ci],
  }
}
const entDef = (kind, id) => ents[curTset()]?.[kind]?.[id]
function defaultName(kind, id) {
  if (kind === "enemy")
    return ENEMY_NAMES.get(Number(id)) ?? `enemy ${id}`
  return `${kind} ${id}`
}
function entLabel(kind, id) {
  const d = entDef(kind, id)
  return d && d.name ? d.name : defaultName(kind, id)
}
function setEntDef(kind, id, patch) {
  const t = curTset()
  ents[t] ??= {}
  ents[t][kind] ??= {}
  ents[t][kind][id] = { ...ents[t][kind][id], ...patch }
  saveEnts()
}
// image for a sprite source; null only while it is still loading
function srcImage(src) {
  if (src.startsWith("upload:")) {
    const im = uploadImgs[src]
    if (!im)
      throw new Error(`uploaded image ${src} is missing from storage`)
    return im.complete ? im : null
  }
  if (!sheetsLoaded) return null
  const im = images[src]
  if (!im)
    throw new Error(`sprite uses images/${src} which did not load`)
  return im
}
function addUploadImage(key, url) {
  const im = new Image()
  im.onload = () => {
    if (!$("entPicker").hidden && pk.src === key) pkDraw()
    renderAll()
  }
  im.src = url
  uploadImgs[key] = im
}
for (const [key, url] of Object.entries(uploads))
  addUploadImage(key, url)

function render() {
  const cv = $("cv"),
    ctx = cv.getContext("2d")
  cv.width = cv.clientWidth
  cv.height = cv.clientHeight
  ctx.fillStyle = "#18181b"
  ctx.fillRect(0, 0, cv.width, cv.height)
  if (!cur.level) return
  if (needFit && cv.clientWidth) {
    needFit = false
    fit()
  }
  const L = cur.level,
    T = ts()
  ctx.setTransform(view.z, 0, 0, view.z, view.x, view.y)
  ctx.imageSmoothingEnabled = false
  const W = L.tiles[0].length,
    H = L.tiles.length
  ctx.fillStyle = "#33353c"
  ctx.fillRect(0, 0, W * T, H * T)
  const x0 = Math.max(0, Math.floor(-view.x / view.z / T)),
    x1 = Math.min(W, Math.ceil((cv.width - view.x) / view.z / T))
  const y0 = Math.max(0, Math.floor(-view.y / view.z / T)),
    y1 = Math.min(H, Math.ceil((cv.height - view.y) / view.z / T))
  const missing = new Set()
  const showMissing = $("ovMissing").checked,
    showSpecial = $("ovSpecial").checked,
    showCol = $("ovCol").checked
  ctx.font = `${Math.max(6, (9 / view.z) * 1.4)}px sans-serif`
  for (let l = 0; l < L.layerCount; l++) {
    if (!vis[l]) continue
    for (let y = y0; y < y1; y++) {
      const row = L.tiles[y]
      for (let x = x0; x < Math.min(x1, row.length); x++) {
        const id = row[x][l]
        if (id === undefined || id === 0) continue
        if (SPECIAL[id]) {
          if (showSpecial) {
            ctx.fillStyle = SPECIAL[id][1]
            ctx.fillRect(x * T, y * T, T, T)
          }
          continue
        }
        const a = atlas.get(id)
        if (a)
          ctx.drawImage(a.im, a.sx, a.sy, T, T, x * T, y * T, T, T)
        else {
          missing.add(id)
          if (showMissing) {
            ctx.fillStyle = "rgba(255,0,255,.3)"
            ctx.fillRect(x * T, y * T, T, T)
            if (view.z > 0.8) {
              ctx.fillStyle = "#fff"
              ctx.fillText(id, x * T + 2, y * T + T / 2)
            }
          }
        }
        if (showCol) {
          const col =
            FLOOR_SLOPE.has(id) ? "rgba(255,150,0,.45)"
            : CEIL_SLOPE.has(id) ? "rgba(180,0,255,.45)"
            : SOLID.has(id) ? "rgba(255,0,0,.45)"
            : THRU.has(id) ? "rgba(0,120,255,.45)"
            : null
          if (col) {
            ctx.fillStyle = col
            ctx.fillRect(x * T, y * T, T, T)
          }
        }
      }
    }
  }
  // grid outline
  ctx.strokeStyle = "rgba(255,255,255,.25)"
  ctx.lineWidth = 1 / view.z
  ctx.strokeRect(0, 0, W * T, H * T)

  const half = unitPx() === T ? T / 2 : 0
  const marker = (rows_, kind, color, on) => {
    if (!on) return
    ctx.fillStyle = color
    ctx.strokeStyle = "#000"
    ctx.lineWidth = 1 / view.z
    for (const r of rows_) {
      const p = entPos(r)
      const d = entDef(kind, p.id)
      const im = d && d.src ? srcImage(d.src) : null
      if (im) {
        ctx.drawImage(
          im,
          d.sx,
          d.sy,
          d.sw,
          d.sh,
          p.x + d.ox,
          p.y + d.oy,
          d.sw * d.scale,
          d.sh * d.scale,
        )
      } else {
        ctx.beginPath()
        ctx.arc(p.x + half, p.y + half, T / 3, 0, 7)
        ctx.fill()
        ctx.stroke()
      }
      ctx.fillStyle = "#fff"
      ctx.fillText(
        entLabel(kind, p.id),
        p.x + half + T / 3,
        p.y + half,
      )
      ctx.fillStyle = color
    }
  }
  marker(
    L.enemies,
    "enemy",
    "rgba(255,60,60,.8)",
    $("ovEnemies").checked,
  )
  marker(L.items, "item", "rgba(255,210,0,.8)", $("ovItems").checked)
  marker(
    L.objects,
    "object",
    "rgba(0,210,255,.8)",
    $("ovObjects").checked,
  )

  if ($("ovDoors").checked) {
    const u = unitPx()
    L.doors.forEach((d, i) => {
      ctx.strokeStyle = i === cur.hiDoor ? "#ff0" : "#0f0"
      ctx.lineWidth = (i === cur.hiDoor ? 3 : 2) / view.z
      ctx.strokeRect(d[0] * u, d[1] * u, d[2] * u, d[3] * u)
      const k = doorLink(cur.roomIdx, i)
      ctx.fillStyle = "#0f0"
      ctx.fillText(
        k ? `D${i} → R${k.room + 1}.D${k.door}` : `D${i}`,
        d[0] * u,
        d[1] * u - 2,
      )
    })
  }
  if ($("ovStart").checked) {
    const u = unitPx()
    ctx.strokeStyle = "#fff"
    ctx.lineWidth = 2 / view.z
    ctx.strokeRect(L.start[0] * u, L.start[1] * u, T, T)
    ctx.fillStyle = "#fff"
    ctx.fillText("start", L.start[0] * u, L.start[1] * u - 2)
  }
  $("status").dataset.missing =
    missing.size ?
      `unmapped tile ids: ${[...missing]
        .sort((a, b) => a - b)
        .slice(0, 40)
        .join(", ")}${missing.size > 40 ? " ..." : ""}`
    : ""
  if (!hoverText)
    $("status").textContent = $("status").dataset.missing || ""
}
let hoverText = ""

// mouse
{
  const cv = $("cv")
  let drag = null
  cv.addEventListener("mousedown", (e) => {
    drag = {
      x: e.clientX,
      y: e.clientY,
      vx: view.x,
      vy: view.y,
      moved: false,
    }
    cv.style.cursor = "grabbing"
  })
  window.addEventListener("mouseup", (e) => {
    if (drag && !drag.moved && cur.level) clickAt(e)
    drag = null
    cv.style.cursor = "grab"
  })
  window.addEventListener("mousemove", (e) => {
    if (drag) {
      if (
        Math.abs(e.clientX - drag.x) + Math.abs(e.clientY - drag.y) >
        3
      )
        drag.moved = true
      if (drag.moved) {
        view.x = drag.vx + e.clientX - drag.x
        view.y = drag.vy + e.clientY - drag.y
        render()
      }
    }
  })
  cv.addEventListener("mousemove", (e) => {
    if (!drag) hover(e)
  })
  cv.addEventListener(
    "wheel",
    (e) => {
      e.preventDefault()
      const r = cv.getBoundingClientRect(),
        mx = e.clientX - r.left,
        my = e.clientY - r.top
      const f = e.deltaY < 0 ? 1.15 : 1 / 1.15
      view.x = mx - (mx - view.x) * f
      view.y = my - (my - view.y) * f
      view.z *= f
      render()
    },
    { passive: false },
  )
}
function worldPos(e) {
  const r = $("cv").getBoundingClientRect()
  return {
    x: (e.clientX - r.left - view.x) / view.z,
    y: (e.clientY - r.top - view.y) / view.z,
  }
}
function doorAt(w) {
  const u = unitPx()
  return cur.level.doors.findIndex(
    (d) =>
      w.x >= d[0] * u &&
      w.x < (d[0] + d[2]) * u &&
      w.y >= d[1] * u &&
      w.y < (d[1] + d[3]) * u,
  )
}
function hover(e) {
  if (!cur.level) return
  const L = cur.level,
    T = ts(),
    w = worldPos(e)
  const tx = Math.floor(w.x / T),
    ty = Math.floor(w.y / T)
  const cell = L.tiles[ty] && L.tiles[ty][tx]
  if (!cell) {
    hoverText = ""
    return
  }
  let t = `tile (${tx},${ty})  ids: ${cell.join(" # ")}`
  const near = (rows_, kind) =>
    rows_
      .filter((r) => {
        const p = entPos(r)
        return (
          Math.floor(p.x / T) === tx && Math.floor(p.y / T) === ty
        )
      })
      .forEach((r) => {
        t += `\n${kind} "${entLabel(kind, entPos(r).id)}": [${r.join(",")}]`
      })
  near(L.enemies, "enemy")
  near(L.items, "item")
  near(L.objects, "object")
  const di = doorAt(w)
  if (di >= 0) t += `\ndoor ${di}: [${L.doors[di].join(",")}]`
  hoverText = t
  $("status").textContent = t
}
function clickAt(e) {
  const di = doorAt(worldPos(e))
  if (di < 0) return
  const k = doorLink(cur.roomIdx, di)
  if (!k)
    throw new Error(`door ${di} has no link in the world's doorArray`)
  selectRoom(k.room, k.door)
}

// ================= sheets tab =================
let selSheet = SHEETS[0],
  selCell = null
function buildSheetList() {
  const s = $("sheetSel")
  s.innerHTML = ""
  const tset = cur.world ? cur.world.tileset : "default"
  const worldPlace = place[tset] || {}

  for (const f of SHEETS) {
    const im = images[f]
    s.add(
      new Option(
        `${f}  ${im ? im.width + "x" + im.height : "(not loaded)"}  ${worldPlace[f] ? "placed" : "unplaced"}`,
        f,
      ),
    )
  }
  s.value = selSheet
  const p = worldPlace[selSheet]
  $("fCol").value = p ? p.col : ""
  $("fRow").value = p ? p.row : ""
  $("fPadX").value = p ? p.padX : 0
  $("fPadY").value = p ? p.padY : 0
  drawSheet()
}

$("fApply").onclick = () => {
  const tset = cur.world ? cur.world.tileset : "default"
  place[tset] ??= {}
  place[tset][selSheet] = {
    col: readIntField("fCol", "col"),
    row: readIntField("fRow", "row"),
    padX: readIntField("fPadX", "padX"),
    padY: readIntField("fPadY", "padY"),
  }
  savePlace()
  rebuildAtlas()
  buildSheetList()
  renderAll()
}

$("fRemove").onclick = () => {
  const tset = cur.world ? cur.world.tileset : "default"
  if (place[tset]) {
    delete place[tset][selSheet]
    savePlace()
    rebuildAtlas()
    buildSheetList()
    renderAll()
  }
}

$("anchorBtn").onclick = () => {
  if (!selCell) throw new Error("click a cell in the sheet first")
  if (selCell.c < 0 || selCell.r < 0)
    throw new Error("selected cell is outside the grid")
  const id = readIntField("anchorId", "tile id"),
    C = mcols()
  const col = (id % C) - selCell.c,
    row = Math.floor(id / C) - selCell.r
  if (col < 0 || row < 0)
    throw new Error(
      `anchoring cell (${selCell.c},${selCell.r}) to id ${id} puts the sheet at col ${col}, row ${row}`,
    )

  const tset = cur.world ? cur.world.tileset : "default"
  place[tset] ??= {}
  place[tset][selSheet] = {
    col,
    row,
    padX: readIntField("fPadX", "padX"),
    padY: readIntField("fPadY", "padY"),
  }
  savePlace()
  rebuildAtlas()
  buildSheetList()
  renderAll()
}
function drawSheet() {
  const im = images[selSheet],
    cv = $("sheetCv")
  if (!im) {
    cv.width = 1
    cv.height = 1
    return
  }
  const z = Number($("sheetZoom").value),
    T = ts()
  const p = tilePlace()[selSheet]
  const padX = p ? p.padX : Number($("fPadX").value),
    padY = p ? p.padY : Number($("fPadY").value)
  cv.width = im.width * z
  cv.height = im.height * z
  const ctx = cv.getContext("2d")
  ctx.imageSmoothingEnabled = false
  ctx.fillStyle = "#444"
  ctx.fillRect(0, 0, cv.width, cv.height)
  ctx.drawImage(im, 0, 0, cv.width, cv.height)
  ctx.strokeStyle = "rgba(255,255,255,.3)"
  ctx.lineWidth = 1
  for (let x = padX; x <= im.width; x += T) {
    ctx.beginPath()
    ctx.moveTo(x * z + 0.5, 0)
    ctx.lineTo(x * z + 0.5, cv.height)
    ctx.stroke()
  }
  for (let y = padY; y <= im.height; y += T) {
    ctx.beginPath()
    ctx.moveTo(0, y * z + 0.5)
    ctx.lineTo(cv.width, y * z + 0.5)
    ctx.stroke()
  }
  if (selCell) {
    ctx.strokeStyle = "#ff0"
    ctx.lineWidth = 2
    ctx.strokeRect(
      (padX + selCell.c * T) * z,
      (padY + selCell.r * T) * z,
      T * z,
      T * z,
    )
  }
}
function sheetCellAt(e) {
  const r = $("sheetCv").getBoundingClientRect(),
    z = Number($("sheetZoom").value),
    T = ts()
  const p = tilePlace()[selSheet]
  const padX = p ? p.padX : Number($("fPadX").value),
    padY = p ? p.padY : Number($("fPadY").value)
  return {
    c: Math.floor(((e.clientX - r.left) / z - padX) / T),
    r: Math.floor(((e.clientY - r.top) / z - padY) / T),
  }
}
$("sheetSel").onchange = (e) => {
  selSheet = e.target.value
  selCell = null
  buildSheetList()
}
$("sheetZoom").onchange = drawSheet
$("fPadX").onchange = $("fPadY").onchange = drawSheet
$("sheetCv").addEventListener("click", (e) => {
  selCell = sheetCellAt(e)
  $("sheetStatus").textContent =
    `selected cell col ${selCell.c}, row ${selCell.r}`
  drawSheet()
})
$("sheetCv").addEventListener("mousemove", (e) => {
  const { c, r } = sheetCellAt(e),
    p = tilePlace()[selSheet]
  $("sheetStatus").textContent =
    `cell col ${c}, row ${r}` +
    (p ?
      `  -> tile id ${(p.row + r) * mcols() + p.col + c}`
    : "  (sheet unplaced)") +
    (selCell ?
      `   | selected: col ${selCell.c}, row ${selCell.r}`
    : "")
})
function readIntField(id, name) {
  const v = $(id).value
  if (v === "") throw new Error(`${name} is empty`)
  return num(v, name)
}

// ================= atlas tab =================
function drawAtlas() {
  const cv = $("atlasCv"),
    z = Number($("atlasZoom").value),
    T = ts(),
    C = mcols()
  if (!atlas.size) {
    cv.width = 1
    cv.height = 1
    $("atlasInfo").textContent = "no sheets placed yet"
    return
  }
  const maxId = Math.max(...atlas.keys())
  const nrows = Math.ceil((maxId + 1) / C)
  cv.width = C * T * z
  cv.height = nrows * T * z
  const ctx = cv.getContext("2d")
  ctx.imageSmoothingEnabled = false
  ctx.fillStyle = "#33353c"
  ctx.fillRect(0, 0, cv.width, cv.height)
  for (const [id, a] of atlas)
    ctx.drawImage(
      a.im,
      a.sx,
      a.sy,
      T,
      T,
      (id % C) * T * z,
      Math.floor(id / C) * T * z,
      T * z,
      T * z,
    )
  ctx.strokeStyle = "rgba(255,255,255,.12)"
  for (let x = 0; x <= C; x++) {
    ctx.beginPath()
    ctx.moveTo(x * T * z + 0.5, 0)
    ctx.lineTo(x * T * z + 0.5, cv.height)
    ctx.stroke()
  }
  for (let y = 0; y <= nrows; y++) {
    ctx.beginPath()
    ctx.moveTo(0, y * T * z + 0.5)
    ctx.lineTo(cv.width, y * T * z + 0.5)
    ctx.stroke()
  }
  $("atlasInfo").textContent =
    `${atlas.size} tiles mapped, ids up to ${maxId}`
}
$("atlasZoom").onchange = drawAtlas
$("atlasCv").addEventListener("mousemove", (e) => {
  const r = $("atlasCv").getBoundingClientRect(),
    z = Number($("atlasZoom").value),
    T = ts()
  const c = Math.floor((e.clientX - r.left) / z / T),
    row = Math.floor((e.clientY - r.top) / z / T)
  const id = row * mcols() + c
  $("atlasStatus").textContent =
    `tile id ${id} (col ${c}, row ${row})  ${atlas.has(id) ? "" : "unmapped"}`
})

// ================= entities tab (names + sprites, per tileset) =================
{
  const btn = document.createElement("button")
  btn.dataset.tab = "entities"
  btn.textContent = "Entities (names & sprites)"
  $("tabs").appendChild(btn)
  const tab = document.createElement("div")
  tab.className = "tab"
  tab.id = "tab-entities"
  tab.innerHTML = `
    <div class="row"><span id="entInfo"></span><button id="entExport">Copy settings JSON</button></div>
    <div id="entPicker" hidden style="border-bottom:1px solid #111;background:#222228;padding:4px">
      <div class="row">
        <b id="pkTitle"></b>
        <select id="pkSrc"></select>
        <label>zoom <select id="pkZoom"><option>1</option><option selected>2</option><option>3</option><option>4</option><option>6</option></select></label>
        <button id="pkUpload">Upload image...</button><input type="file" id="pkFile" accept="image/*" hidden>
        <button id="pkWhole">Whole image</button>
        <label>offX <input type="number" id="pkOx"></label>
        <label>offY <input type="number" id="pkOy"></label>
        <label>scale <input type="number" id="pkScale" step="0.25" value="1"></label>
        <button id="pkSave">Save sprite</button>
        <button id="pkClear">Remove sprite</button>
        <button id="pkClose">Close</button>
      </div>
      <div style="max-height:320px;overflow:auto"><canvas id="pkCv"></canvas></div>
      <div class="status" id="pkStatus">Drag a rectangle on the image to choose the sprite. offX/offY = where the sprite's top-left sits relative to the entity's tile top-left (px).</div>
    </div>
    <div class="scroll" id="entList" style="padding:6px"></div>`
  $("tabs").parentElement.appendChild(tab)
}

const pk = { kind: null, id: null, src: null, rect: null, drag: null }
const pkCv = $("pkCv")
function pkFillSources() {
  const s = $("pkSrc")
  s.innerHTML = ""
  for (const f of [...SHEETS, ...Object.keys(uploads)])
    s.add(new Option(f, f))
  s.value = pk.src
}
function openPicker(kind, id) {
  const d = entDef(kind, id)
  const has = d && d.src
  pk.kind = kind
  pk.id = id
  pk.src = has ? d.src : SHEETS[0]
  pk.rect = has ? { x: d.sx, y: d.sy, w: d.sw, h: d.sh } : null
  $("pkOx").value = has ? d.ox : ""
  $("pkOy").value = has ? d.oy : ""
  $("pkScale").value = has ? d.scale : 1
  $("pkTitle").textContent =
    `${kind} ${id}: ${entLabel(kind, id)} (tileset ${curTset()})`
  $("entPicker").hidden = false
  pkFillSources()
  pkDraw()
}
function pkDraw() {
  const im = srcImage(pk.src)
  if (!im) {
    pkCv.width = 1
    pkCv.height = 1
    return
  }
  const z = Number($("pkZoom").value)
  pkCv.width = im.width * z
  pkCv.height = im.height * z
  const ctx = pkCv.getContext("2d")
  ctx.imageSmoothingEnabled = false
  ctx.fillStyle = "#444"
  ctx.fillRect(0, 0, pkCv.width, pkCv.height)
  ctx.drawImage(im, 0, 0, pkCv.width, pkCv.height)
  if (pk.rect) {
    ctx.strokeStyle = "#ff0"
    ctx.lineWidth = 2
    ctx.strokeRect(
      pk.rect.x * z,
      pk.rect.y * z,
      pk.rect.w * z,
      pk.rect.h * z,
    )
  }
}
function pkPt(e) {
  const im = srcImage(pk.src),
    r = pkCv.getBoundingClientRect(),
    z = Number($("pkZoom").value)
  return {
    x: Math.max(
      0,
      Math.min(im.width - 1, Math.floor((e.clientX - r.left) / z)),
    ),
    y: Math.max(
      0,
      Math.min(im.height - 1, Math.floor((e.clientY - r.top) / z)),
    ),
  }
}
const pkRectFrom = (a, b) => ({
  x: Math.min(a.x, b.x),
  y: Math.min(a.y, b.y),
  w: Math.abs(a.x - b.x) + 1,
  h: Math.abs(a.y - b.y) + 1,
})
function pkRectChanged() {
  // a new selection resets the offsets to "bottom-centred on the tile"
  $("pkOx").value = (ts() - pk.rect.w) / 2
  $("pkOy").value = ts() - pk.rect.h
  $("pkStatus").textContent =
    `selected ${pk.rect.w}x${pk.rect.h} at ${pk.rect.x},${pk.rect.y}`
}
pkCv.addEventListener("mousedown", (e) => {
  pk.drag = pkPt(e)
  pk.rect = pkRectFrom(pk.drag, pk.drag)
  pkDraw()
})
pkCv.addEventListener("mousemove", (e) => {
  if (!pk.drag) return
  pk.rect = pkRectFrom(pk.drag, pkPt(e))
  pkDraw()
})
window.addEventListener("mouseup", () => {
  if (!pk.drag) return
  pk.drag = null
  pkRectChanged()
})
$("pkWhole").onclick = () => {
  const im = srcImage(pk.src)
  if (!im) throw new Error("image is still loading")
  pk.rect = { x: 0, y: 0, w: im.width, h: im.height }
  pkDraw()
  pkRectChanged()
}
$("pkSrc").onchange = (e) => {
  pk.src = e.target.value
  pk.rect = null
  pkDraw()
}
$("pkZoom").onchange = pkDraw
$("pkUpload").onclick = () => $("pkFile").click()
$("pkFile").onchange = async (e) => {
  const f = e.target.files[0]
  const url = await new Promise((res, rej) => {
    const fr = new FileReader()
    fr.onload = () => res(fr.result)
    fr.onerror = () => rej(fr.error)
    fr.readAsDataURL(f)
  })
  const key = `upload:${f.name}`
  uploads[key] = url
  localStorage.lv_uploads = JSON.stringify(uploads) // throws if over the storage quota
  addUploadImage(key, url)
  pk.src = key
  pk.rect = null
  pkFillSources()
  e.target.value = ""
}
$("pkSave").onclick = () => {
  if (!pk.rect)
    throw new Error(
      "drag a rectangle on the image (or press Whole image) first",
    )
  const scale = readIntField("pkScale", "scale")
  if (scale <= 0) throw new Error("scale must be above 0")
  setEntDef(pk.kind, pk.id, {
    src: pk.src,
    sx: pk.rect.x,
    sy: pk.rect.y,
    sw: pk.rect.w,
    sh: pk.rect.h,
    ox: readIntField("pkOx", "offX"),
    oy: readIntField("pkOy", "offY"),
    scale,
  })
  buildEntities()
  render()
}
$("pkClear").onclick = () => {
  setEntDef(pk.kind, pk.id, {
    src: undefined,
    sx: undefined,
    sy: undefined,
    sw: undefined,
    sh: undefined,
    ox: undefined,
    oy: undefined,
    scale: undefined,
  })
  pk.rect = null
  pkDraw()
  buildEntities()
  render()
}
$("pkClose").onclick = () => {
  $("entPicker").hidden = true
}
$("entExport").onclick = () =>
  navigator.clipboard.writeText(localStorage.lv_ents)

// every id used by any room of any world sharing the current tileset
function entityUsage() {
  const use = { enemy: new Map(), item: new Map(), object: new Map() }
  const ci = Number(localStorage.lv_colId)
  for (const w of data.worlds) {
    if (w.tileset !== curTset()) continue
    for (const row of w.rooms) {
      const lv = data.levels.get(String(row[6]))
      if (!lv)
        throw new Error(
          `world "${w.title}" uses roomID ${row[6]} but no <level> has it`,
        )
      for (const [kind, list] of [
        ["enemy", lv.enemies],
        ["item", lv.items],
        ["object", lv.objects],
      ])
        for (const r of list) {
          if (r[ci] === undefined)
            throw new Error(
              `${kind} row [${r}] has no id column ${ci}`,
            )
          const id = String(r[ci])
          use[kind].set(id, (use[kind].get(id) || 0) + 1)
        }
    }
  }
  return use
}
function buildEntities() {
  const box = $("entList")
  box.innerHTML = ""
  if (!data) {
    box.textContent = "Load a level XML first."
    return
  }
  $("entInfo").textContent =
    `Stored for tileset ${curTset()} (applies to every world using it). Currently: "${cur.world.title}".`
  const use = entityUsage()
  for (const kind of KINDS) {
    const h = document.createElement("h2")
    h.textContent = `${kind}s (${use[kind].size} ids)`
    box.appendChild(h)
    const ids = [...use[kind].keys()].sort(
      (a, b) => Number(a) - Number(b),
    )
    for (const id of ids) {
      const d = entDef(kind, id)
      const row = document.createElement("div")
      row.style.cssText =
        "display:flex;gap:8px;align-items:center;margin:2px 0"
      const th = document.createElement("canvas")
      th.width = th.height = 48
      const ctx = th.getContext("2d")
      ctx.fillStyle = "#33353c"
      ctx.fillRect(0, 0, 48, 48)
      const im = d && d.src ? srcImage(d.src) : null
      if (im) {
        const k = Math.min(48 / d.sw, 48 / d.sh)
        ctx.imageSmoothingEnabled = false
        ctx.drawImage(
          im,
          d.sx,
          d.sy,
          d.sw,
          d.sh,
          (48 - d.sw * k) / 2,
          (48 - d.sh * k) / 2,
          d.sw * k,
          d.sh * k,
        )
      }
      const lab = document.createElement("span")
      lab.style.cssText = "width:90px"
      lab.textContent = `id ${id} x${use[kind].get(id)}`
      const inp = document.createElement("input")
      inp.type = "text"
      inp.value = d && d.name ? d.name : ""
      inp.placeholder = defaultName(kind, id)
      inp.onchange = () => {
        setEntDef(kind, id, { name: inp.value.trim() || undefined })
        render()
      }
      const b = document.createElement("button")
      b.textContent = im ? "Change sprite..." : "Assign sprite..."
      b.onclick = () => openPicker(kind, id)
      row.append(th, lab, inp, b)
      box.appendChild(row)
    }
  }
}

// ================= wiring =================
function renderAll() {
  render()
  if ($("tab-atlas").classList.contains("active")) drawAtlas()
}
document.querySelectorAll("#tabs button").forEach(
  (b) =>
    (b.onclick = () => {
      document
        .querySelectorAll("#tabs button")
        .forEach((x) => x.classList.toggle("on", x === b))
      document
        .querySelectorAll(".tab")
        .forEach((t) =>
          t.classList.toggle(
            "active",
            t.id === "tab-" + b.dataset.tab,
          ),
        )
      if (b.dataset.tab === "level") render()
      if (b.dataset.tab === "sheets") drawSheet()
      if (b.dataset.tab === "atlas") drawAtlas()
      if (b.dataset.tab === "entities") buildEntities()
    }),
)
;[
  "ovMissing",
  "ovSpecial",
  "ovCol",
  "ovDoors",
  "ovEnemies",
  "ovItems",
  "ovObjects",
  "ovStart",
].forEach((id) => ($(id).onchange = render))
$("world").onchange = (e) => selectWorld(Number(e.target.value))
$("tsInput").value = localStorage.lv_ts
$("colsInput").value = localStorage.lv_cols
$("unit").value = localStorage.lv_unit
$("colId").value = localStorage.lv_colId
$("colX").value = localStorage.lv_colX
$("colY").value = localStorage.lv_colY
$("tsInput").onchange = (e) => {
  localStorage.lv_ts = e.target.value
  rebuildAtlas()
  if (cur.level) fit()
  buildSheetList()
  renderAll()
}
$("colsInput").onchange = (e) => {
  localStorage.lv_cols = e.target.value
  rebuildAtlas()
  buildSheetList()
  renderAll()
}
$("unit").onchange = (e) => {
  localStorage.lv_unit = e.target.value
  render()
}
$("colId").onchange = (e) => {
  localStorage.lv_colId = e.target.value
  render()
}
$("colX").onchange = (e) => {
  localStorage.lv_colX = e.target.value
  render()
}
$("colY").onchange = (e) => {
  localStorage.lv_colY = e.target.value
  render()
}

$("file").onchange = async (e) => {
  loadText(await e.target.files[0].text())
}
$("loadPaste").onclick = () => loadText($("paste").value)
;(async () =>
  loadText(await (await fetch("/levelViewer/full.xml")).text()))()
window.addEventListener("dragover", (e) => e.preventDefault())
window.addEventListener("drop", async (e) => {
  e.preventDefault()
  loadText(await e.dataTransfer.files[0].text())
})
new ResizeObserver(render).observe($("cv"))

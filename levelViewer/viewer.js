"use strict"
// ================= settings (persisted) =================
localStorage.lv_ts ??= "32"
localStorage.lv_cols ??= "62"
localStorage.lv_place ??=
  '{"0":{"tile_1583.png":{"col":0,"row":0,"padX":0,"padY":0},"tile_4235.png":{"col":0,"row":31,"padX":0,"padY":0},"tile_6259.png":{"col":0,"row":12,"padX":0,"padY":0},"tile_1827.png":{"col":0,"row":24,"padX":0,"padY":0},"tile_5871.png":{"col":0,"row":28,"padX":0,"padY":0}},"1":{"tile_1583.png":{"col":0,"row":0,"padX":0,"padY":0},"tile_4235.png":{"col":0,"row":31,"padX":0,"padY":0},"tile_6259.png":{"col":0,"row":12,"padX":0,"padY":0},"tile_1827.png":{"col":0,"row":24,"padX":0,"padY":0},"tile_5871.png":{"col":0,"row":28,"padX":0,"padY":0}},"2":{"tile_3682.png":{"col":0,"row":28,"padX":0,"padY":0},"tile_5783.png":{"col":0,"row":0,"padX":0,"padY":0},"tile_551.png":{"col":0,"row":31,"padX":0,"padY":0},"tile_3186.png":{"col":0,"row":12,"padX":0,"padY":0},"tile_1995.png":{"col":0,"row":24,"padX":0,"padY":0}},"3":{"tile_3682.png":{"col":0,"row":28,"padX":0,"padY":0},"tile_5783.png":{"col":0,"row":0,"padX":0,"padY":0},"tile_551.png":{"col":0,"row":31,"padX":0,"padY":0},"tile_3186.png":{"col":0,"row":12,"padX":0,"padY":0},"tile_1995.png":{"col":0,"row":24,"padX":0,"padY":0}},"4":{"tile_4141.png":{"col":0,"row":28,"padX":0,"padY":0},"tile_5314.png":{"col":0,"row":0,"padX":0,"padY":0},"tile_4681.png":{"col":0,"row":31,"padX":0,"padY":0},"tile_5741.png":{"col":0,"row":24,"padX":0,"padY":0},"tile_3090.png":{"col":0,"row":12,"padX":0,"padY":0}},"5":{"tile_5314.png":{"col":0,"row":0,"padX":0,"padY":0},"tile_4681.png":{"col":0,"row":31,"padX":0,"padY":0},"tile_5741.png":{"col":0,"row":24,"padX":0,"padY":0},"tile_3090.png":{"col":0,"row":12,"padX":0,"padY":0},"tile_4141.png":{"col":0,"row":28,"padX":0,"padY":0}},"6":{"tile_1490.png":{"col":0,"row":28,"padX":0,"padY":0},"tile_4968.png":{"col":0,"row":0,"padX":0,"padY":0},"tile_5562.png":{"col":0,"row":31,"padX":0,"padY":0},"tile_2289.png":{"col":0,"row":12,"padX":0,"padY":0},"tile_928.png":{"col":0,"row":24,"padX":0,"padY":0}},"7":{"tile_5562.png":{"col":0,"row":31,"padX":0,"padY":0},"tile_2289.png":{"col":0,"row":12,"padX":0,"padY":0},"tile_4968.png":{"col":0,"row":0,"padX":0,"padY":0},"tile_928.png":{"col":0,"row":24,"padX":0,"padY":0},"tile_1490.png":{"col":0,"row":28,"padX":0,"padY":0}},"8":{"tile_4968.png":{"col":0,"row":0,"padX":0,"padY":0},"tile_5562.png":{"col":0,"row":31,"padX":0,"padY":0},"tile_1490.png":{"col":0,"row":28,"padX":0,"padY":0},"tile_2289.png":{"col":0,"row":12,"padX":0,"padY":0},"tile_928.png":{"col":0,"row":24,"padX":0,"padY":0}},"9":{"tile_4862.png":{"col":0,"row":28,"padX":0,"padY":0},"tile_4064.png":{"col":0,"row":12,"padX":0,"padY":0},"tile_734.png":{"col":0,"row":31,"padX":0,"padY":0},"tile_4567.png":{"col":0,"row":0,"padX":0,"padY":0},"tile_1733.png":{"col":0,"row":24,"padX":0,"padY":0}},"tile_4862.png":{"col":0,"row":28,"padX":0,"padY":0},"tile_4064.png":{"col":0,"row":12,"padX":0,"padY":0},"tile_734.png":{"col":9,"row":15,"padX":0,"padY":0},"tile_4567.png":{"col":0,"row":0,"padX":0,"padY":0}}'
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

// ents[kind][id] = { name, src, sx, sy, sw, sh, ox, oy, scale }
localStorage.lv_ents ??=
  '{"item":{"1":{"src":"coin.png","sx":0,"sy":0,"sw":15,"sh":18,"ox":8.5,"oy":14,"scale":1,"name":"coin"},"2":{"src":"redCoin.png","sx":0,"sy":0,"sw":23,"sh":20,"ox":4.5,"oy":12,"scale":1,"name":"crimson currency"},"3":{"src":"purpleCoin.png","sx":0,"sy":0,"sw":23,"sh":20,"ox":4.5,"oy":12,"scale":1,"name":"purple coin"},"4":{"src":"radishCoin.png","sx":0,"sy":0,"sw":23,"sh":20,"ox":10,"oy":12,"scale":1,"os":4.5,"name":"radich coin"},"5":{"src":"heart.png","sx":0,"sy":0,"sw":22,"sh":20,"ox":5,"oy":12,"scale":1,"name":"heart"},"6":{"src":"flower.png","sx":0,"sy":0,"sw":23,"sh":20,"ox":4.5,"oy":12,"scale":1,"name":"flower"},"7":{"src":"balloon.png","sx":0,"sy":0,"sw":23,"sh":20,"ox":-4.5,"oy":0,"scale":1.75,"name":"balloon"},"8":{"src":"can.png","sx":0,"sy":0,"sw":23,"sh":20,"ox":-4.5,"oy":-12,"scale":2,"name":"fizzocan"},"9":{"src":"worm.png","sx":0,"sy":0,"sw":23,"sh":20,"ox":4.5,"oy":12,"scale":1.5,"name":"worm"}},"enemy":{"1":{"src":"onion.png","sx":0,"sy":0,"sw":112,"sh":141,"ox":-20,"oy":-38,"scale":0.5},"2":{"src":"brown onion.png","sx":0,"sy":0,"sw":114,"sh":138,"ox":-10,"oy":-20,"scale":0.4},"3":{"src":"army onion.png","sx":0,"sy":0,"sw":56,"sh":68,"ox":-12,"oy":-36,"scale":1},"4":{"src":"helmet.png","sx":0,"sy":0,"sw":23,"sh":20,"ox":4.5,"oy":0,"scale":1.5,"name":"helmet"},"5":{"src":"kaiseronion.png","sx":0,"sy":0,"sw":49,"sh":65,"ox":2,"oy":-20,"scale":0.8},"6":{"src":"redtomato.png","sx":0,"sy":0,"sw":101,"sh":178,"ox":-5,"oy":-46,"scale":0.5},"7":{"src":"romatomato.png","sx":0,"sy":0,"sw":92,"sh":141,"ox":-10,"oy":-45,"scale":0.5},"8":{"src":"runttomato.png","sx":0,"sy":0,"sw":72,"sh":84,"ox":7,"oy":0,"scale":0.3},"9":{"src":"subhead.png","sx":0,"sy":0,"sw":46,"sh":60,"ox":-7,"oy":-28,"scale":1,"name":"sub back"},"10":{"src":"subhead.png","sx":0,"sy":0,"sw":46,"sh":60,"ox":-7,"oy":-28,"scale":1,"name":"sub mid"},"11":{"src":"subhead.png","sx":0,"sy":0,"sw":46,"sh":60,"ox":-7,"oy":-28,"scale":1,"name":"sub head"},"12":{"src":"slider.png","sx":0,"sy":0,"sw":92,"sh":92,"ox":1,"oy":2,"scale":0.3},"13":{"src":"brussellark.png","sx":0,"sy":0,"sw":136,"sh":100,"ox":0,"oy":0,"scale":0.25},"14":{"src":"lettucelark.png","sx":0,"sy":0,"sw":208,"sh":137,"ox":-19,"oy":-19,"scale":0.4},"15":{"src":"leafylark.png","sx":0,"sy":0,"sw":208,"sh":136,"ox":-10,"oy":-7,"scale":0.3},"16":{"src":"dillwheel.png","sx":0,"sy":0,"sw":48,"sh":48,"ox":-8,"oy":-16,"scale":1},"17":{"src":"dillworm.png","sx":0,"sy":0,"sw":90,"sh":56,"ox":0,"oy":0,"scale":0.75},"18":{"src":"dillweed.png","sx":0,"sy":0,"sw":217,"sh":161,"ox":-35,"oy":-10,"scale":0.5},"19":{"src":"blueshroom.png","sx":0,"sy":0,"sw":45,"sh":58,"ox":-6.5,"oy":-25,"scale":1},"20":{"src":"thornshroom.png","sx":0,"sy":0,"sw":173,"sh":168,"ox":-25,"oy":-53,"scale":0.5},"21":{"src":"bowshroom.png","sx":0,"sy":0,"sw":56,"sh":60,"ox":-12,"oy":-28,"scale":1},"22":{"src":"bacobar.png","sx":0,"sy":0,"sw":65,"sh":182,"ox":-9.5,"oy":-100,"scale":0.75},"23":{"src":"bacoburn.png","sx":0,"sy":0,"sw":38,"sh":105,"ox":-3,"oy":-102,"scale":1.3},"25":{"src":"swisszack.png","sx":0,"sy":0,"sw":55,"sh":184,"ox":-11.5,"oy":9,"scale":1},"26":{"src":"cheddarmack.png","sx":0,"sy":0,"sw":181,"sh":161,"ox":-20,"oy":-23,"scale":0.4},"27":{"src":"pepperjack.png","sx":0,"sy":0,"sw":129,"sh":168,"ox":-16,"oy":-42,"scale":0.4},"28":{"src":"radish.png","sx":0,"sy":0,"sw":129,"sh":151,"ox":-13,"oy":-30,"scale":0.5},"29":{"src":"laddish.png","sx":0,"sy":0,"sw":129,"sh":152,"ox":-16,"oy":-35,"scale":0.5},"30":{"src":"pararadish.png","sx":0,"sy":0,"sw":96,"sh":173,"ox":-8,"oy":-40,"scale":0.5},"31":{"src":"cheesewheel.png","sx":0,"sy":0,"sw":145,"sh":153,"ox":-24,"oy":-24,"scale":0.5},"32":{"src":"jellyback.png","sx":0,"sy":0,"sw":70,"sh":60,"ox":-19,"oy":-28,"scale":1},"33":{"src":"awesomesaucer.png","sx":0,"sy":0,"sw":174,"sh":128,"ox":-25,"oy":-31,"scale":0.5},"34":{"src":"burgerzilla.png","sx":0,"sy":0,"sw":111,"sh":179,"ox":-9,"oy":-43,"scale":0.5},"35":{"src":"sarge.png","sx":0,"sy":0,"sw":96,"sh":80,"ox":-81,"oy":-117,"scale":2},"36":{"src":"madish.png","sx":0,"sy":0,"sw":213,"sh":213,"ox":-73,"oy":-100,"scale":1},"37":{"src":"madish.png","sx":0,"sy":0,"sw":213,"sh":213,"ox":-73,"oy":-100,"scale":1}},"object":{"1":{"src":"pullcord.png","sx":0,"sy":86,"sw":104,"sh":74,"ox":-6,"oy":-2,"scale":1,"name":"pull cord"},"2":{"src":"boulder.png","sx":0,"sy":0,"sw":219,"sh":218,"ox":11,"oy":-45,"scale":0.35,"name":"boulder"},"3":{"src":"3227_ladder_sheet_ladder_sheet.png","sx":0,"sy":0,"sw":30,"sh":32,"ox":1,"oy":0,"scale":1,"name":"ladder"},"4":{"src":"redballoonbig.png","sx":117,"sy":17,"sw":96,"sh":116,"ox":-33,"oy":-35,"scale":1,"name":"large"},"5":{"src":"redballoonsmall.png","sx":77,"sy":7,"sw":65,"sh":80,"ox":-16.5,"oy":-28,"scale":1,"name":"small"},"6":{"src":"blueballoonlarge.png","sx":213,"sy":23,"sw":96,"sh":109,"ox":-32,"oy":-33,"scale":1,"name":"large"},"7":{"name":"small","src":"blueballoonlarge.png","sx":117,"sy":22,"sw":96,"sh":109,"ox":-15,"oy":-19,"scale":0.66},"8":{"src":"purpleballoonsmall.png","sx":141,"sy":13,"sw":65,"sh":74,"ox":-30,"oy":-31,"scale":1.5,"name":"large"},"9":{"src":"purpleballoonsmall.png","sx":141,"sy":13,"sw":65,"sh":74,"ox":-18,"oy":-19,"scale":1,"name":"small"},"10":{"src":"greenballoonlarge.png","sx":117,"sy":22,"sw":95,"sh":109,"ox":-31.5,"oy":-37,"scale":1,"name":"large"},"11":{"src":"greenballoonsmall.png","sx":205,"sy":12,"sw":64,"sh":75,"ox":-16,"oy":-18,"scale":1,"name":"small"},"12":{"name":"large","src":"silverballoonlarge.png","sx":116,"sy":22,"sw":97,"sh":110,"ox":-32.5,"oy":-31,"scale":1},"13":{"src":"silverballoonlarge.png","sx":117,"sy":22,"sw":95,"sh":109,"ox":-17,"oy":-16,"scale":0.66,"name":"small"},"14":{"src":"acorn.png","sx":887,"sy":0,"sw":41,"sh":44,"ox":-4.5,"oy":-12,"scale":1,"name":"falling accorn"},"15":{"src":"onberry.png","sx":559,"sy":0,"sw":37,"sh":44,"ox":-2.5,"oy":-12,"scale":1,"name":"orange accorn"},"16":{"src":"offberry.png","sx":558,"sy":0,"sw":40,"sh":44,"ox":-4,"oy":-12,"scale":1,"name":"blue accorn"},"17":{"src":"switch.png","sx":0,"sy":0,"sw":64,"sh":31,"ox":0,"oy":0,"scale":1,"name":"button"},"18":{"src":"door.png","sx":0,"sy":0,"sw":116,"sh":310,"ox":0,"oy":10,"scale":0.41,"name":"door"},"19":{"src":"goal.png","sx":0,"sy":0,"sw":378,"sh":449,"ox":1,"oy":6,"scale":0.4,"name":"right side goal"},"20":{"src":"goalmirror.png","sx":0,"sy":0,"sw":378,"sh":449,"ox":5,"oy":6,"scale":0.4,"name":"left side goal"},"21":{"src":"21.png","sx":0,"sy":0,"sw":32,"sh":32,"ox":0,"oy":0,"scale":1,"name":"ghram cracker"},"22":{"src":"22.png","sx":0,"sy":0,"sw":32,"sh":64,"ox":0,"oy":0,"scale":1,"name":"ghram cracker"},"23":{"src":"23.png","sx":0,"sy":0,"sw":64,"sh":32,"ox":0,"oy":0,"scale":1,"name":"ghram cracker"},"24":{"src":"24.png","sx":0,"sy":0,"sw":64,"sh":64,"ox":0,"oy":0,"scale":1,"name":"ghram cracker"},"25":{"src":"25.png","sx":0,"sy":0,"sw":64,"sh":96,"ox":0,"oy":0,"scale":1,"name":"ghram cracker"},"26":{"src":"cheesecannon.png","sx":1,"sy":1,"sw":53,"sh":85,"ox":-10.5,"oy":-53,"scale":1,"name":"cheese shooter"},"27":{"src":"suace.png","sx":16,"sy":64,"sw":65,"sh":66,"ox":0,"oy":0,"scale":1,"name":"sauce"},"28":{"src":"cp.png","sx":0,"sy":0,"sw":27,"sh":36,"ox":2.5,"oy":-45,"scale":2,"name":"checkpoint"},"29":{"name":"door closer or camera trigger"},"30":{"name":"camera trigger or door closer"},"31":{"src":"spikefloor.png","sx":0,"sy":0,"sw":641,"sh":90,"ox":0,"oy":0,"scale":1,"name":"spike floor"},"32":{"src":"rainbowsauce.png","sx":17,"sy":65,"sw":63,"sh":62,"ox":0,"oy":0,"scale":1,"name":"rainbow slowfall thing"},"33":{"name":"tutorial","src":"worm.png","sx":0,"sy":0,"sw":0,"sh":0,"ox":0,"oy":0,"scale":1}}}'
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
// active tracers, keyed "tileset:kind:id" so an id on one tileset never traces another's
const tracers = new Set()
const tracerKey = (kind, id) => `${curTset()}:${kind}:${id}`

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
const entDef = (kind, id) => ents?.[kind]?.[id]
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
  ents[kind] ??= {}
  ents[kind][id] = { ...ents[kind][id], ...patch }
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
  if (tracers.size) {
    // lines run from the viewport centre to every on-screen entity of a traced type
    ctx.setTransform(1, 0, 0, 1, 0, 0)
    const cx = cv.width / 2,
      cy = cv.height / 2
    const colors = {
      enemy: "#ff4040",
      item: "#ffd200",
      object: "#00d2ff",
    }
    const counts = new Map()
    for (const key of tracers) {
      const [tset, kind, id] = key.split(":")
      if (tset === curTset()) counts.set(key, { kind, id, n: 0 })
    }
    ctx.lineWidth = 2
    for (const [kind, list] of [
      ["enemy", L.enemies],
      ["item", L.items],
      ["object", L.objects],
    ]) {
      for (const r of list) {
        const p = entPos(r)
        const key = tracerKey(kind, p.id)
        if (!tracers.has(key)) continue
        const sx = (p.x + half) * view.z + view.x,
          sy = (p.y + half) * view.z + view.y
        if (sx < 0 || sx > cv.width || sy < 0 || sy > cv.height)
          continue
        counts.get(key).n++
        ctx.strokeStyle = colors[kind]
        ctx.beginPath()
        ctx.moveTo(cx, cy)
        ctx.lineTo(sx, sy)
        ctx.stroke()
        ctx.beginPath()
        ctx.arc(sx, sy, 9, 0, 7)
        ctx.stroke()
      }
    }
    ctx.font = "12px sans-serif"
    let ly = 8
    for (const { kind, id, n } of counts.values()) {
      ctx.fillStyle = "rgba(0,0,0,.7)"
      ctx.fillRect(8, ly, 220, 18)
      ctx.fillStyle = colors[kind]
      ctx.fillText(
        `${kind} ${entLabel(kind, id)}: ${n} on screen`,
        12,
        ly + 13,
      )
      ly += 20
    }
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
    // if (worldPlace[f])
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
    <div class="row"><span id="entInfo"></span><button id="entExport">Copy settings JSON</button><button id="entTraceClear">Clear tracers</button></div>
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
$("entTraceClear").onclick = () => {
  tracers.clear()
  buildEntities()
  render()
}

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
      const tr = document.createElement("button")
      const trKey = tracerKey(kind, id)
      tr.textContent = "Tracer"
      tr.classList.toggle("on", tracers.has(trKey))
      tr.onclick = () => {
        if (tracers.has(trKey)) tracers.delete(trKey)
        else tracers.add(trKey)
        tr.classList.toggle("on", tracers.has(trKey))
        render()
      }
      row.append(th, lab, inp, b, tr)
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

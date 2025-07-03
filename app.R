# app.R
#/* app.R */
library(shiny)
library(bslib)


# from your R console, in the Rumman/ directory:

# 1) make the www folder if it doesn't exist
if(!dir.exists("www")) dir.create("www")

# 2) write out the CSS we discussed
css <- "
/* Navbar tweaks */
.navbar {
  background-color: #CE1126 !important;
}
.navbar .navbar-brand,
.navbar .nav-link {
  color: #FFFFFF !important;
  font-weight: bold;
}
.navbar .nav-link:hover {
  color: #FFD2D2 !important;
}

/* Page titles */
.page-title {
  color: #CE1126;
  font-size: 2.5rem;
  margin-top: 1rem;
  margin-bottom: 1rem;
}

/* Section headings */
.section-title {
  color: #007A3D;
  margin-top: 1.5rem;
}

/* Body text */
.section-text {
  color: #2D2D2D;
  line-height: 1.6;
  margin-bottom: 1rem;
}

/* Logo padding */
.logo {
  margin-top: 0.5rem;
  margin-bottom: 1rem;
}

/* Blog placeholder */
.blog-placeholder {
  color: #555555;
  font-style: italic;
}
"
writeLines(css, file.path("www", "custom.css"))



# Dark theme with pomegranate & vibrant green accents
theme <- bs_theme(
  version      = 5,
  bg           = "#1e1e1e",        # dark charcoal background
  fg           = "#f5f5f5",        # off-white text
  primary      = "#CE1126",        # pomegranate red accent
  secondary    = "#00A86B",        # vibrant green accent
  base_font    = font_google("Rubik"),         # clean, modern
  heading_font = font_google("Rubik Mono One"),# bold, techy
  code_font    = font_google("Fira Code")
)

ui <- navbarPage(
  title = div(
    img(src = "images/pome.png", height = "32px", style = "filter: drop-shadow(1px 1px 2px rgba(0,0,0,0.5));"),
    span("Rumman", style = "font-family:'Rubik Mono One',sans-serif;color:#CE1126;font-size:1.6em;margin-left:8px;")
  ),
  theme = theme,
  id    = "nav",
  header = tags$style(HTML(" 
    body { background-color: #1e1e1e; }
    .navbar { background-color: #2b2b2b !important; }
    .navbar-nav .nav-link { color: #f5f5f5 !important; font-family:'Rubik Mono One',sans-serif; }
    .navbar-nav .nav-link.active { color: #CE1126 !important; }
    .hero { padding:3rem 1rem; text-align:center; }
    .display-3 { font-family:'Rubik Mono One',sans-serif; color:#CE1126; font-size:3rem; }
    .card { background-color: #2b2b2b; border: none; border-left: 4px solid #00A86B; }
    .card-title { font-family:'Rubik Mono One',sans-serif; color:#00A86B; font-size:1.5rem; }
    .section-text { color: #d0d0d0; font-family:'Rubik',sans-serif; }
    .footer { background-color: #2b2b2b; color:#888; padding:1rem; text-align:center; font-size:0.9em; }
  ")),
  
  # About page -----------------------------------------------------------
  tabPanel(
    "About",
    fluidPage(
      fluidRow(
        column(12,
               div(class="hero",
                   h1("Rumman Collective", class="display-3"),
                   img(src="images/pome.png", height="160px", style="margin-top:1rem;")
               )
        )
      ),
      fluidRow(
        column(8, offset=2,
               tags$section(
                 tags$div(class="card mb-4 shadow-sm",
                          tags$div(class="card-body",
                                   h3("Who we are", class="card-title"),
                                   p("", class="section-text")
                          )
                 ),
                 tags$div(class="card mb-4 shadow-sm",
                          tags$div(class="card-body",
                                   h3("What we stand for", class="card-title"),
                                   p("", class="section-text")
                          )
                 ),
                 tags$div(class="card mb-4 shadow-sm",
                          tags$div(class="card-body",
                                   h3("What we stand against", class="card-title"),
                                   p("", class="section-text")
                          )
                 ),
                 tags$div(class="card mb-4 shadow-sm",
                          tags$div(class="card-body",
                                   h3("What is our main objective", class="card-title"),
                                   p("", class="section-text")
                          )
                 ),
                 tags$div(class="card mb-4 shadow-sm",
                          tags$div(class="card-body",
                                   h3("How we pursue our objective", class="card-title"),
                                   p("", class="section-text")
                          )
                 )
               )
        )
      )
    )
  ),
  
  # Blog page ------------------------------------------------------------
  tabPanel(
    "Blog",
    fluidPage(
      fluidRow(
        column(12, align="center",
               h2("Blog Coming Soon", style="color:#f5f5f5;font-family:'Rubik Mono One',sans-serif;margin-top:4rem;"),
               p("Stay tuned for our latest posts!", style="color:#b0b0b0;font-family:'Rubik',sans-serif;font-size:1.1em;")
        )
      )
    )
  ),
  
  # Footer ----------------------------------------------------------------
  footer = div(class = "footer",
               "© ", format(Sys.Date(), "%Y"), " Rumman Collective — Building community through shared purpose"
  )
)

server <- function(input, output, session) {}

# Launch -----------------------------------------------------------------
shinyApp(ui, server)





describe('add_to_cart', () => {

  beforeEach(() => {
    cy.visit('/')
    cy.once('uncaught:exception', () => false);
  })

  it ('vists the homepage', () => {
    cy.visit('/')
  })

  it ('can add a new product to My Cart', () => {

    cy.get("body > main > section > div > article:nth-child(1) > div > form > button")
    cy.contains('Add').click({ force: true })

    cy.get("#email").click().type('test@test.com')
    cy.get("#password").click({ force: true }).type('test123')

    cy.get('body > main > div > form > div > div > div.d-flex.flex-column.align-items-center > input[type=submit]').click({ force: true })

    cy.get('body > main > section > div > article:nth-child(1) > div > form > button').click({ force: true })

    cy.get("#navbarSupportedContent > ul:nth-child(2) > li.nav-item.end-0 > a")
    cy.contains('My Cart').click({ force: true })
    cy.get('body > main > section > div.panel.panel-default.items > table > tbody > tr > td:nth-child(2) > h4').should('have.text', 'Scented Blade')
  })
})
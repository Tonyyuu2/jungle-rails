

// describe('product_details', () => {

//   beforeEach(() => {
//     cy.visit('/')
//     cy.once('uncaught:exception', () => false);
//   })

//   it ('vists the homepage', () => {
//     cy.visit('/')
//   })

//   it ('can click a product', () => {
//     cy.get("body > main > section > div > article:nth-child(1) > a > img").first().click()
//   })

//   it ('can add a new product to My Cart', () => {

//     cy.get("body > main > section > div > article:nth-child(1) > div > form > button")
//     cy.contains('Add').click()
//     cy.get("#navbarSupportedContent > ul:nth-child(2) > li.nav-item.end-0 > a")
//     cy.contains('My Cart').click()
//     cy.get('body > main > section > div.panel.panel-default.items > table > tbody > tr > td:nth-child(2) > h4').should('have.text', 'Scented Blade')
//   })
// })
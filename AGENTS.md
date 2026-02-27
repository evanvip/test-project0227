# Agent Guidelines

This is a simple static HTML project. No build system, linting, or tests configured.

## Commands

- **View**: Open `index.html` directly in browser
- **Preview**: Use a local server like `npx serve` or VS Code Live Server
- **Test**: Manual testing in browser - verify layout, responsiveness, and functionality

## Project Structure

- Keep all source files in the root directory
- Single `index.html` file with embedded CSS and JS for simple projects
- Separate CSS/JS files only when file exceeds 500 lines
- Use descriptive filenames: `index.html`, `styles.css`, `script.js`

## Code Style

### General Principles
- Keep files simple and readable
- Prefer simplicity over cleverness
- Avoid over-engineering or unnecessary abstraction
- Write code that is easy to understand and maintain

### HTML

**Structure**
- Use semantic HTML5 elements (`header`, `nav`, `main`, `section`, `article`, `footer`)
- Include proper meta tags for accessibility and SEO
- Use `lang` attribute on `<html>` element
- Include viewport meta tag for responsive design

**Formatting**
- Use lowercase for all tags and attributes
- Use double quotes for all attribute values
- Indent with 2 spaces (no tabs)
- Close all tags properly (self-closing tags included)
- Maximum line length: 120 characters
- One attribute per line for elements with many attributes

**Attributes Order**
1. `id`, `class`
2. `src`, `href`, `action`
3. `alt`, `title`, `aria-*`
4. Other attributes
5. Event handlers (`onclick`, etc. - avoid these, use addEventListener)

**Do**
```html
<img src="image.png" alt="Description" class="responsive">
<input type="text" id="username" required>
<button type="submit">Submit</button>
```

**Don't**
```html
<IMG SRC="image.png">  <!-- uppercase -->
<input type=text id=user1>  <!-- no quotes -->
<div onclick="doSomething()">  <!-- inline handler -->
```

### CSS

**Organization**
- Group related styles together
- Follow this order: reset/normalize, variables, typography, layout, components, utilities
- Use CSS variables for colors, spacing, fonts (define at `:root`)
- Mobile-first responsive design using media queries

**Naming**
- Use kebab-case for class names: `.main-content`, `.nav-link`
- Use meaningful, descriptive names: `.user-avatar` not `.ua`
- BEM naming for complex components: `.block__element--modifier`

**Formatting**
- One selector per line
- Properties on separate lines
- Indent with 2 spaces
- Include space before `{`
- One space after colon

**Do**
```css
.button {
  background: var(--primary-color);
  color: white;
  padding: 12px 24px;
  border: none;
  border-radius: 8px;
}
```

**Don't**
```css
.button { background: blue;color:white;padding:12px 24px; }
```

**Responsive**
- Use relative units (rem, em, %) over pixels where appropriate
- Define breakpoints: mobile (< 768px), tablet (768-1024px), desktop (> 1024px)
- Test at all breakpoints

### JavaScript

**Variables**
- Use `const` by default, `let` when reassignment is needed
- Never use `var`
- Use meaningful variable names: `userName` not `u` or `x`
- Group related constants together

**Functions**
- Use arrow functions for callbacks and anonymous functions
- Use function declarations for named functions
- Keep functions small and focused (single responsibility)
- Use descriptive names: `calculateTotal()` not `calc()`

**Syntax**
- Use ES6+ syntax: arrow functions, destructuring, template literals, spread operator
- Use `===` instead of `==`
- Prefer template literals over string concatenation
- Use async/await over raw promises when possible

**DOM Manipulation**
- Cache DOM queries: `const container = document.querySelector('.container')`
- Use event delegation for multiple similar elements
- Clean up event listeners when removing elements
- Use `classList` for adding/removing classes

**Error Handling**
- Always wrap async code in try/catch
- Provide meaningful error messages
- Never expose sensitive information in error messages
- Handle edge cases explicitly

**Do**
```javascript
const fetchData = async (url) => {
  try {
    const response = await fetch(url);
    if (!response.ok) {
      throw new Error(`HTTP error: ${response.status}`);
    }
    return await response.json();
  } catch (error) {
    console.error('Failed to fetch data:', error.message);
    throw error;
  }
};
```

**Don't**
```javascript
var data = fetch(url).then(r => r.json());  // var, no error handling
```

### Accessibility

- Use semantic HTML elements
- Include `alt` text for all images
- Use proper heading hierarchy (h1 → h2 → h3)
- Ensure sufficient color contrast (4.5:1 for text)
- Make interactive elements keyboard accessible
- Use `aria-*` attributes when needed
- Include `label` elements for form inputs

### Performance

- Minimize external dependencies
- Optimize images (use appropriate formats and sizes)
- Defer non-critical JavaScript
- Use CSS animations over JavaScript where possible
- Lazy load images below the fold

### Git

**Commits**
- Write clear, concise commit messages in present tense
- Start with verb: "Add", "Fix", "Update", "Remove"
- Keep subject line under 72 characters
- Reference issue numbers when applicable

**Do**
```
Add user authentication flow
Fix navigation menu on mobile
Update dependencies to latest versions
```

**Don't**
```
fixed it
WIP
asdf
```

**Security**
- Never commit secrets, API keys, or credentials
- Use environment variables for sensitive data
- Add sensitive files to .gitignore

## Testing

Since this is a static HTML project:
- Test manually in Chrome, Firefox, Safari, and Edge
- Verify responsive behavior at different screen sizes
- Check accessibility with keyboard navigation
- Validate HTML at https://validator.w3.org
- Test form validation and error states
- Verify all links work correctly

## When to Ask

- If the project needs a build system or framework
- If you need to add automated tests
- If the project grows beyond simple static files
- If you need to integrate external APIs or services
- If there are security concerns or questions
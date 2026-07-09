const { chromium } = require('@playwright/test');

(async () => {
  const browser = await chromium.launch({ headless: true });
  const page = await browser.newPage({ viewport: { width: 1280, height: 900 } });

  const errors = [];
  page.on('pageerror', e => errors.push(e.message));
  page.on('requestfailed', r => errors.push('FAILED: ' + r.url()));

  // 1. Login
  await page.goto('http://localhost:3000/login', { waitUntil: 'networkidle' });
  await page.fill('input[type="email"], input[name="email"]', 'mai@gmail.com');
  await page.fill('input[type="password"], input[name="password"]', 'password123');
  await page.click('button[type="submit"]');
  await page.waitForURL('**/', { timeout: 10000 }).catch(() => {});
  await page.screenshot({ path: 'C:/Temp/claude/d--BookStorm-master/c8a51879-c3e3-4ea1-b0b9-8430252fc089/scratchpad/vnpay_1_login.png' });
  console.log('Step 1 - After login URL:', page.url());

  // 2. Go to a book and add to cart
  await page.goto('http://localhost:3000/shop', { waitUntil: 'networkidle' });
  const firstBook = page.locator('a[href*="/book/"]').first();
  const bookHref = await firstBook.getAttribute('href');
  await page.goto('http://localhost:3000' + bookHref, { waitUntil: 'networkidle' });
  await page.screenshot({ path: 'C:/Temp/claude/d--BookStorm-master/c8a51879-c3e3-4ea1-b0b9-8430252fc089/scratchpad/vnpay_2_book.png' });
  console.log('Step 2 - Book page:', page.url());

  // Add to cart
  const addBtn = page.locator('button.addToCartBtn, button:has-text("Thêm vào giỏ")').first();
  await addBtn.click();
  await page.waitForURL('**/cart', { timeout: 8000 }).catch(() => {});
  await page.screenshot({ path: 'C:/Temp/claude/d--BookStorm-master/c8a51879-c3e3-4ea1-b0b9-8430252fc089/scratchpad/vnpay_3_cart.png' });
  console.log('Step 3 - Cart URL:', page.url());

  // 3. Go to checkout
  await page.evaluate(() => window.scrollTo(0, document.body.scrollHeight));
  await page.waitForTimeout(800);
  const checkoutBtn = page.locator('button:has-text("Tiến hành đặt hàng")').first();
  await checkoutBtn.click();
  await page.waitForURL('**/checkout', { timeout: 10000 }).catch(() => {});
  await page.waitForTimeout(2000);
  await page.screenshot({ path: 'C:/Temp/claude/d--BookStorm-master/c8a51879-c3e3-4ea1-b0b9-8430252fc089/scratchpad/vnpay_4_checkout.png' });
  console.log('Step 4 - Checkout URL:', page.url());

  // 4. Select VNPay
  const vnpayRadio = page.locator('input[value="VNPAY"]');
  if (await vnpayRadio.count() > 0) {
    await vnpayRadio.click();
    console.log('Step 4b - Selected VNPAY');
  } else {
    console.log('Step 4b - VNPAY option NOT FOUND');
  }
  await page.screenshot({ path: 'C:/Temp/claude/d--BookStorm-master/c8a51879-c3e3-4ea1-b0b9-8430252fc089/scratchpad/vnpay_5_selected.png' });

  // 5. Submit order and capture redirect
  const submitBtn = page.locator('button[type="submit"]:has-text("Đặt hàng"), button:has-text("Đặt hàng")').first();
  const [response] = await Promise.all([
    page.waitForNavigation({ timeout: 15000, waitUntil: 'domcontentloaded' }).catch(e => ({ error: e.message })),
    submitBtn.click().catch(e => console.log('Submit error:', e.message)),
  ]);

  await page.screenshot({ path: 'C:/Temp/claude/d--BookStorm-master/c8a51879-c3e3-4ea1-b0b9-8430252fc089/scratchpad/vnpay_6_after_submit.png' });
  console.log('Step 5 - After submit URL:', page.url());
  console.log('Errors:', errors.length ? errors : 'none');

  await browser.close();
})();

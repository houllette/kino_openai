// import * as Vue from "https://cdn.jsdelivr.net/npm/vue@3.2.26/dist/vue.esm-browser.prod.js";

export async function init(ctx, payload) {
  await Promise.all([
    ctx.importCSS("main.css"),
    ctx.importCSS(
      "https://fonts.googleapis.com/css2?family=Inter:wght@400;500&display=swap"
    ),
    ctx.importCSS(
      "https://fonts.googleapis.com/css2?family=JetBrains+Mono&display=swap"
    ),
    ctx.importCSS(
      "https://cdn.jsdelivr.net/npm/remixicon@2.5.0/fonts/remixicon.min.css"
    ),
    ctx.importJS("https://unpkg.com/alpinejs@3.10.5/dist/cdn.min.js")
  ]);

  ctx.root.innerHTML = `
    <div class="app" x-data="{helpBoxOpen: false}">
      <form>
        <div class="container">
          <div class="row header">
            <div class="icon-logo">
              <img src="openai_logo.svg">
            </div>
            <div class="inline-field">
              <label class="inline-input-label">API Secret Key</label>
              <input class="input input--xs input-text" id="openai_secret_key" placeholder="secret key" readonly>
            </div>
            <div class="inline-field">
              <label class="inline-input-label">Organization ID</label>
              <input class="input input--xs input-text" id="openai_organization_id" placeholder="org-something" readonly>
            </div>
            <div class="grow"></div>
            <button type="button" class="icon-button" @click="helpBoxOpen = !helpBoxOpen">
              <i class="ri ri-questionnaire-line" aria-hidden="true"></i>
            </button>
          </div>
          <div class="help-box" x-cloak x-show="helpBoxOpen">
            <div class="section">
              <p>
                This Smart cell sends a prompt to OpenAI's GPT-3 service. In order to use it, you need to
                <a href="https://beta.openai.com/docs/api-reference/authentication" target="_blank">create an account at OpenAI and get your associated tokens</a>.
              </p>
            </div>
          </div>
          <div class="row">
            <div class="field grow">
              <label class="input-label">Prompt</label>
              <textarea id="prompt" rows="10" class="input input--text-area" placeholder="Insert your prompt here..."></textarea>
            </div>
          </div>
        </div>
      </form>
    </div>
  `;

  const secretKeyEl = document.getElementById("openai_secret_key");
  secretKeyEl.value = payload.fields.openai_secret_key;

  const orgIdEl = document.getElementById("openai_organization_id");
  orgIdEl.value = payload.fields.openai_organization_id;

  const promptEl = document.getElementById("prompt");
  promptEl.value = payload.fields.prompt;

  promptEl.addEventListener("change", (event) => {
    ctx.pushEvent("update_prompt", event.target.value)
  });

  secretKeyEl.addEventListener("click", (event) => {
    ctx.selectSecret((openai_secret_key) => {
      ctx.pushEvent("update_openai_secret_key", openai_secret_key);
    }, "OPEN_AI_API_KEY")
  });

  ctx.handleEvent("update_openai_secret_key", (openai_secret_key) => {
    secretKeyEl.value = openai_secret_key;
  });

  orgIdEl.addEventListener("click", (event) => {
    ctx.selectSecret((organization_id) => {
      ctx.pushEvent("update_openai_organization_id", organization_id);
    }, "OPEN_AI_ORGANIZATION_ID")
  });

  ctx.handleEvent("update_openai_organization_id", (openai_organization_id) => {
    orgIdEl.value = openai_organization_id;
  });

  ctx.handleSync(() => {
    // Synchronously invokes change listeners
    document.activeElement &&
      document.activeElement.dispatchEvent(new Event("change"));
  });
}

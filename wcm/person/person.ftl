<div class="person-item">
  <h3>
    ${name.getData()}
  </h3>
  <#if title.getData()?has_content>
  <p class="title">
    ${title.getData()}
  </p>
  </#if>
  <p class="email">
    <a href="mailto:${email.getData()}">${email.getData()}</a>
  </p>
  <p class="phone">
    ${phone.getData()}
  </p>
  <div class="person-content">
    ${content.getData()}
  </div>
</div>

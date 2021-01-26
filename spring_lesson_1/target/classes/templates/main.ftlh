<#import "parts/common.ftlh" as c>
<@c.page>
    <div class="form-row">
        <div class="form-group col-md-6">
            <form method="get" action="/main" class="form-inline">
                <input type="text" name="filter" class="form-control" value="${filter?ifExists}" placeholder="Search by tag">
                <button type="submit" class="btn btn-primary mb-3 mt-2">Search</button>
            </form>
        </div>
    </div>

<#--    Toggle-->
    <p>
        <a class="btn btn-primary" data-bs-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">
            Add new message
        </a>
    </p>
    <div class="collapse <#if message??>show</#if>" id="collapseExample">
        <div class="card card-body">
            <form method="post" enctype="multipart/form-data">
                                    <div class="form-group mb-2">
                                        <input type="text" class="form-control py-4 px=15  ${(textError??)?string('is-invalid', '')}"
                                               value="<#if message??>${message.text}</#if>" name="text" placeholder="Введите сообщение" />
                                        <#if textError??>
                                        <div class="invalid-feedback">
                                            ${textError}
                                        </div>
                                        </#if>
                                    </div>
                                    <div class="form-group mb-2">
                                        <input type="text" class="form-control px=15 ${(tagError??)?string('is-invalid', '')}"
                                               value="<#if message??>${message.tag}</#if>" name="tag" placeholder="Тэг">
                                        <#if tagError??>
                                            <div class="invalid-feedback">
                                                ${tagError}
                                            </div>
                                        </#if>
                                    </div>
                                    <div class="form-group mb-2">
                                        <div class="custom-file">
                                            <input type="file" name="file" id="customFile">
                                        </div>
                                    </div>
                                    <input type="hidden" name="_csrf" value="${_csrf.token}" />
                                    <div class="form-group mb-2">
                                        <button type="submit" class="btn btn-primary">Добавить</button>
                                    </div>
                                </form>
        </div>
    </div>





    <div class="card-columns">
        <#list messages as message>
            <div class="card my-3" style="width: 25em;">
                <#if message.filename??>
                    <img src="/img/${message.filename}" class="card-img-top">
                </#if>
                <div class="m-2">
                    <span>${message.text}</span>
                    <i>${message.tag}</i>
                </div>
                <div class="card-footer text-muted">
                    ${message.authorName}
                </div>
            </div>
        <#else>
            No message
        </#list>
    </div>
</@c.page>
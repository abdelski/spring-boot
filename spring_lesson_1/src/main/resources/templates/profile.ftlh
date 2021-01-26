<#import "parts/common.ftlh" as c>

<@c.page>
    <h5>${username}</h5>

${message?ifExists}
    <form method="post">
        <div class="mb-3">
            <label class="form-label"> Password </label>
            <div class="col-sm-6">
                <input type="password" name="password" class="form-control" placeholder="Enter your password">
            </div>

        </div>
            <div class="mb-3">
                <label class="form-label"> Email </label>
                <div class="col-sm-6">
                    <input type="email" name="email" class="form-control" placeholder="Enter your email" value="${email!''}">
                </div>
            </div>

        <input type="hidden" name="_csrf" value="${_csrf.token}" />

        <button type="submit" class="btn btn-primary">Save</button>
    </form>
</@c.page>
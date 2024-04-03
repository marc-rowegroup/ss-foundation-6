<div class="quoteform-section">
    <div class="dark-overlay">
        <div class="grid-container">
            <div class="grid-x grid-padding-x grid-padding-y quoteform-inner align-middle">
                <div class="cell large-6 text-center medium-text-left large-text-left">
                    <% if InPage('Home') %>
                        <h3>
                            Are you ready<br>to experience the<br>SafetyNet difference?
                        </h3>
                        <p>Fill out the form and we will reach out to you shortly</p>
                    <% else_if InPage('Inicio') %>
                        <h3>
                            ¿Estás listo<br>experimentar el<br>Diferencia de SafetyNet?
                        </h3>
                        <p>Complete el formulario y nos comunicaremos con usted en breve</p>
                    <% end_if %>
                </div>
                <div class="cell large-6">
                    <% if $CurrentSubsite.Title == 'Spanish' %>
                        $SpanishForm
                    <% else %>
                        $QuestionForm
                    <% end_if %>
                </div>
            </div>
        </div>
    </div>
</div>